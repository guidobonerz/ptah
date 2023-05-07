package main

import (
	"bytes"
	"de/drazil/ptah/structure"
	"encoding/json"
	"flag"
	"fmt"
	"hash/fnv"
	"io/ioutil"
	"log"
	"os"
	"strconv"
	"strings"
	"text/template"
	"time"
)

var configFile string
var inputFolder string
var outputFolder string
var purgeOutputFolders bool
var verbose bool = false
var bundles = make(map[string]map[string]string)
var caution = "/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/\n\n"

func main() {

	flag.StringVar(&configFile, "cf", "default-config.json", "project config file")
	flag.StringVar(&inputFolder, "in", "templates/", "template base path")
	flag.StringVar(&outputFolder, "out", "results/", "generated file base path")
	flag.BoolVar(&purgeOutputFolders, "p", true, "purge all output folders before writing")
	flag.BoolVar(&verbose, "v", true, "verbose mode")

	flag.Usage = func() {
		fmt.Printf("\nptah - Pretty Template Automation Hooligan\na template based code generator\n\ndrazil 2023\n\n")
		fmt.Printf("./ptah.exe -in <inputfolder>\n")
		fmt.Printf("\nAvailable options  :\n")
		fmt.Printf("-cf  <config file>   : path to json project config file\n")
		fmt.Printf("-in  <inputFolder>   : folder of the template file(s)\n")
		fmt.Printf("-out <outputFolder>  : folder of the generated file(s)\n")
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

func getCommonAttributes(attributes []structure.Attribute) []structure.Attribute {
	var commonAttributes []structure.Attribute = attributes
	var filteredCommonAttributes []structure.Attribute
	for _, attribute := range commonAttributes {
		filteredCommonAttributes = append(filteredCommonAttributes, attribute)
	}
	return filteredCommonAttributes
}

func processTemplate(project structure.Project, entity structure.Entity, templateName string, templateDefinition structure.TemplateDefinition, metaData structure.MetaData) {
	var primaryAttributes = getPrimaryAttributes(entity.Attributes)
	var fullNameSpace = ""

	if metaData.BaseNameSpace != "" {
		fullNameSpace += metaData.BaseNameSpace + "."
	}
	fullNameSpace += templateDefinition.NameSpace + "."

	var nameSpacePath = outputFolder + metaData.OutputBasePath + strings.Replace(fullNameSpace, ".", "/", -1)
	var objectName = fmt.Sprintf(templateDefinition.NamePattern, strings.Title(entity.Name))
	var outputFileName = nameSpacePath + objectName + "." + metaData.FileSuffix
	var templateFileName = templateName + ".go.tpl"
	var templatePathName = inputFolder + metaData.TemplateBasePath + templateFileName
	t, err := template.New(templateFileName).Funcs(template.FuncMap{
		"getBaseNameSpace": func() string {
			return metaData.BaseNameSpace
		},
		"getNameSpace": func() string {
			return templateDefinition.NameSpace
		},
		"getNameSpaceByTemplate": func(templateName string) string {
			return project.TemplateDefinition[templateName].NameSpace
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
			return fmt.Sprintf("%s.%s.%s", metaData.BaseNameSpace, templateDefinition.NameSpace, name)
		},
		"getObjectName": func(templateName string) string {
			templateDefinition = project.TemplateDefinition[templateName]
			return fmt.Sprintf(templateDefinition.NamePattern, strings.Title(entity.Name))
		},
		"getUpperCaseName": func(name string) string {
			return strings.ToUpper(name)
		},
		"getCamelCaseName": func(name string) string {
			return strings.Title(name)
		},
		"hasSize": func(attribute structure.Attribute) bool {
			return metaData.DataTypes[attribute.DataTypeKey].HasSize
		},
		"getSize": func(attribute structure.Attribute) string {
			var size = ""
			if metaData.DataTypes[attribute.DataTypeKey].HasSize {
				if attribute.Size == -1 {
					size = metaData.DataTypes[attribute.DataTypeKey].MaxSize
				} else {
					size = strconv.Itoa(attribute.Size)
				}
			}
			return size
		},
		"getArgumentSeparator": func(index int, attributes []structure.Attribute) string {
			var separator = ""
			if len(attributes)-1 != index {
				separator = metaData.ArgumentSeparator + " "
			}
			return separator
		},
		"getAttributes": func() []structure.Attribute {
			var attributes = entity.Attributes
			if !entity.DisableCommonAttributes {
				attributes = append(attributes, getCommonAttributes(project.CommonAttributes)...)
			}
			return attributes
		},
		"getDataTypes": func(attributes []structure.Attribute) []string {
			var dataTypes []string
			for i := 0; i < len(attributes); i++ {
				var dt = metaData.DataTypes[attributes[i].DataTypeKey].NonNullDataType
				if attributes[i].AllowNull {
					dt = metaData.DataTypes[attributes[i].DataTypeKey].DataType
				}
				dataTypes = append(dataTypes, dt)
			}
			return dataTypes
		},
		"getDataType": func(attribute structure.Attribute) string {
			var dt = metaData.DataTypes[attribute.DataTypeKey].NonNullDataType
			if attribute.AllowNull {
				dt = metaData.DataTypes[attribute.DataTypeKey].DataType
			}
			return dt
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
				if attribute.RefEntityName != "" && attribute.RefAttributeName != "" {
					referencingAttributes, exists := references[attribute.RefEntityName]
					if !exists {
						referencingAttributes = []structure.Attribute{}
						referencingAttributes = append(referencingAttributes, attribute)
						references[attribute.RefEntityName] = referencingAttributes
					} else {
						referencingAttributes = append(referencingAttributes, attribute)
						references[attribute.RefEntityName] = referencingAttributes
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
	if !metaData.WriteSeparateFile {
		var tmap, tmapExists = bundles[templateDefinition.MetaData]
		if !tmapExists {
			tmap = make(map[string]string)
			bundles[templateDefinition.MetaData] = tmap
		}
		var text = tmap[templateName]
		var buffer bytes.Buffer
		if err := t.Execute(&buffer, entity); err != nil {
			check(err)
		} else {
			text += buffer.String()
			tmap[templateName] = text + "\n"
			log.Printf("%s successfully buffered", templateName)
		}

	} else {
		generatedFile, err := os.Create(outputFileName)
		check(err)
		generatedFile.WriteString(caution)

		if err := t.Execute(generatedFile, entity); err != nil {
			check(err)
		} else {
			if verbose {
				log.Printf("%s successfully written", outputFileName)
			}
		}
	}
}

func run(file string) error {
	start := time.Now()
	controlFile, err := os.Open(file)
	check(err)

	fmt.Println("successfully opened project file")
	defer controlFile.Close()

	if purgeOutputFolders {
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

	if len(bundles) > 0 {
		for k := range bundles {
			var metaData = project.MetaData[k]
			var content string

			for _, templateName := range metaData.TemplateProcessingOrder {
				content += bundles[k][templateName]
			}

			generatedFile, err := os.Create(outputFolder + metaData.OutputBasePath + "bundled_" + k + "_script." + metaData.FileSuffix)
			check(err)
			generatedFile.WriteString(caution)
			generatedFile.WriteString(content)

		}
	}

	var duration = time.Since(start).Seconds()
	log.Printf("parsing %d entities and wrote %d files in %f seconds.", len(project.Entities), templateCount, duration)
	return nil
}
