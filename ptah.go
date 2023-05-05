package main

import (
	"de/drazil/ptah/structure"
	"encoding/json"
	"flag"
	"fmt"
	"hash/fnv"
	"io/ioutil"
	"log"
	"os"
	"strings"
	"text/template"
	"time"
)

var configFile string
var inputFolder string
var outputFolder string
var pruneOutputFolders bool
var verbose bool = false

func main() {

	flag.StringVar(&configFile, "cf", "default-config.json", "project config file")
	flag.StringVar(&inputFolder, "in", "templates", "template base path")
	flag.StringVar(&outputFolder, "out", "results", "generated file base path")
	flag.BoolVar(&pruneOutputFolders, "p", true, "purge all output folders before writing")
	flag.BoolVar(&verbose, "v", true, "verbose mode")

	flag.Usage = func() {
		fmt.Printf("\nptah : the json based code generator\n\ndrazil 2023\n\n")
		fmt.Printf("./ptah.exe -in <inputfolder>\n")
		fmt.Printf("\nAvailable options  :\n")
		fmt.Printf("-cf  <config file>   : path of the json project config file to be processed\n")
		fmt.Printf("-in  <inputFolder>   : path of the json project config file to be processed\n")
		fmt.Printf("-out <outputFolder> : path of the json project config file to be processed\n")
		fmt.Printf("-p   <true*|false>   : purge all output folders before writing\n")
		fmt.Printf("-v   <true*|false>   : verbose mode\n")
	}
	flag.Parse()

	if configFile == "" {
		fmt.Printf("ERROR: config file should NOT be empty")
		flag.Usage()
		os.Exit(1)
	}
	run(configFile)
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func getPrimaryAttributes(attributes []structure.Attribute) []structure.Attribute {
	var pkAttribute []structure.Attribute
	var list []structure.Attribute = attributes
	for i := 0; i < len(list); i++ {
		if list[i].PrimaryKey {
			pkAttribute = append(pkAttribute, list[i])
		}
	}
	return pkAttribute
}

func processTemplate(project structure.Project, entity structure.Entity, templateName string, templateDefinition structure.TemplateDefinition, metaData structure.MetaData) {
	var primaryAttributes = getPrimaryAttributes(entity.Attributes)
	var fullNameSpace = project.BaseNameSpace + "." + templateDefinition.NameSpace
	var nameSpacePath = outputFolder + "/" + strings.Replace(fullNameSpace, ".", "/", -1)
	var objectName = fmt.Sprintf(templateDefinition.NamePattern, strings.Title(entity.Name))
	var outputFileName = nameSpacePath + "/" + objectName + "." + metaData.Suffix
	var templateFileName = templateName + ".go.tpl"
	var templatePathName = inputFolder + "/" + metaData.TemplateBasePath + templateFileName
	t, err := template.New(templateFileName).Funcs(template.FuncMap{
		"getBaseNameSpace": func() string {
			return project.BaseNameSpace
		},
		"getNameSpace": func() string {
			return templateDefinition.NameSpace
		},
		"getFullNameSpace": func() string {
			return fullNameSpace
		},
		"getTemplateName": func() string {
			return templateName
		},
		"getFullObjectName": func(templateName string) string {
			templateDefinition = project.TemplateDefinition[templateName]
			var name = fmt.Sprintf(templateDefinition.NamePattern, strings.Title(entity.Name))
			return fmt.Sprintf("%s.%s.%s", project.BaseNameSpace, templateDefinition.NameSpace, name)
		},
		"getObjectName": func(templateName string) string {
			templateDefinition = project.TemplateDefinition[templateName]
			return fmt.Sprintf(templateDefinition.NamePattern, strings.Title(entity.Name))
		},
		"getArgumentSeparator": func(index int, attributes []structure.Attribute) string {
			var separator = ""
			if len(attributes)-1 != index {
				separator = metaData.ArgumentSeparator + " "
			}
			return separator
		},
		"getDataTypes": func(attributes []structure.Attribute) []string {
			var dataTypes []string
			for i := 0; i < len(attributes); i++ {
				dataTypes = append(dataTypes, metaData.DataTypes[attributes[i].DataType].DataType)
			}
			return dataTypes
		},
		"getDataType": func(key string) string {
			return metaData.DataTypes[key].DataType
		},
		"getUpperCaseName": func(name string) string {
			return strings.ToUpper(name)
		},
		"getCamelCaseName": func(name string) string {
			return strings.Title(name)
		},
		"getUid": func() uint32 {
			algorithm := fnv.New32()
			algorithm.Write([]byte(objectName))
			return algorithm.Sum32()
		},
		"getReferences": func() map[string][]structure.Attribute {
			var attribute structure.Attribute
			var list []structure.Attribute = entity.Attributes

			var references = make(map[string][]structure.Attribute)

			for i := 0; i < len(list); i++ {
				attribute = list[i]
				if attribute.RefEntity != "" && attribute.RefAttribute != "" {
					referencingAttributes, exists := references[attribute.RefEntity]
					if !exists {
						referencingAttributes = []structure.Attribute{}
						referencingAttributes = append(referencingAttributes, attribute)
						references[attribute.RefEntity] = referencingAttributes
					} else {
						referencingAttributes = append(referencingAttributes, attribute)
						references[attribute.RefEntity] = referencingAttributes
					}
				}
			}
			return references
		},
		"getPrimaryAttributes": func() []structure.Attribute {
			return primaryAttributes
		},
		"hasMultiplePrimaryAttriutes": func() bool {
			return len(primaryAttributes) > 1
		}}).ParseFiles(templatePathName)

	check(err)
	if err := os.MkdirAll(nameSpacePath, os.ModePerm); err != nil {
		check(err)
	}
	generatedFile, err := os.Create(outputFileName)
	check(err)
	generatedFile.WriteString("/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/\n\n")

	if err := t.Execute(generatedFile, entity); err != nil {
		check(err)
	} else {
		if verbose {
			log.Printf("%s successfully written", outputFileName)
		}
	}
}

func run(file string) error {
	start := time.Now()
	controlFile, err := os.Open(file)
	check(err)

	fmt.Println("successfully opened project file")
	defer controlFile.Close()

	if pruneOutputFolders {
		err := os.RemoveAll(outputFolder)
		log.Printf("purge folder [ %s ]", outputFolder)
		check(err)
	}
	byteValue, _ := ioutil.ReadAll(controlFile)

	var project structure.Project
	json.Unmarshal(byteValue, &project)
	var templateCount int = 0
	for _, entity := range project.Entities {
		var primaryAttributes = getPrimaryAttributes(entity.Attributes)
		var multiAttributeIdOptionUsed = false
		var templateDefinition structure.TemplateDefinition
		var metaData structure.MetaData
		for _, templateName := range entity.TemplateNames {
			templateDefinition = project.TemplateDefinition[templateName]
			metaData = project.MetaData[templateDefinition.MetaData]
			processTemplate(project, entity, templateName, templateDefinition, metaData)
			templateCount++
			if metaData.EnableMultiAttributeIdOption && !multiAttributeIdOptionUsed && len(primaryAttributes) > 1 {
				multiAttributeIdOptionUsed = true
				var idTemplate = "id"
				templateDefinition = project.TemplateDefinition[idTemplate]
				metaData = project.MetaData[templateDefinition.MetaData]
				processTemplate(project, entity, idTemplate, templateDefinition, metaData)
				templateCount++
			}
		}
	}
	var duration = time.Now().Sub(start).Seconds()
	log.Printf("parsing %d entities and writing %d files in %f seconds.", len(project.Entities), templateCount, duration)
	return nil
}
