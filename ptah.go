package main

import (
	"de/drazil/ptah/structure"
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strings"
	"text/template"
	"time"
)

var verbose bool = false

func main() {
	var inputfile string

	flag.StringVar(&inputfile, "in", "test.json", "project file")
	flag.BoolVar(&verbose, "v", true, "verbose mode")

	flag.Usage = func() {
		fmt.Printf("\nptah : the json based code generator\n\ndrazil 2023\n\n")
		fmt.Printf("./ptah.exe -in <inputfolder>\n")
		fmt.Printf("\nAvailable options  :\n")
		fmt.Printf("-in <input file>   : path of the json project file to be processed\n")
		fmt.Printf("-v <true*|false>   : verbose mode.\n")
	}
	flag.Parse()

	if inputfile == "" {
		fmt.Printf("ERROR: input file should NOT be empty")
		flag.Usage()
		os.Exit(1)
	}
	parseTemplates(inputfile)
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func parseTemplates(file string) error {
	start := time.Now()
	controlFile, err := os.Open(file)
	check(err)

	fmt.Println("successfully opened project file")
	defer controlFile.Close()

	byteValue, _ := ioutil.ReadAll(controlFile)

	var project structure.Project
	json.Unmarshal(byteValue, &project)
	var templateCount int = 0

	for _, entity := range project.Entities {
		for _, templateName := range entity.TemplateNames {
			templateCount++
			var templateDefinition = project.TemplateDefinition[templateName]
			var metaData = project.MetaData[templateDefinition.MetaData]
			var fullNameSpace = project.BaseNameSpace + "." + templateDefinition.NameSpace
			var nameSpacePath = "results/" + strings.Replace(fullNameSpace, ".", "/", -1)
			var objectName = fmt.Sprintf(templateDefinition.NamePattern, strings.Title(entity.Name))
			var outputFileName = nameSpacePath + "/" + objectName + "." + metaData.Suffix
			var templateFileName = templateName + ".go.tpl"
			var templatePathName = "templates/" + metaData.TemplateBasePath + templateFileName
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
				"getObjectName": func() string {
					return objectName
				},
				"getArgumentSeparator": func(index int, attributes []structure.Attribute) string {
					var separator = ""
					if len(attributes)-1 != index {
						separator = metaData.ArgumentSeparator + " "
					}
					return separator
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
				"getPrimaryKeyString": func() string {
					var pk string
					var list []structure.Attribute = entity.Attributes
					for i := 0; i < len(list); i++ {
						if list[i].PrimaryKey {
							pk += list[i].Name + ", "
						}
					}
					pk = pk[:len(pk)-2]
					return pk
				}, "getPrimaryKeyAttribute": func() structure.Attribute {
					var attribute structure.Attribute
					var list []structure.Attribute = entity.Attributes
					for i := 0; i < len(list); i++ {
						if list[i].PrimaryKey {
							attribute = list[i]
						}
					}
					return attribute
				}}).ParseFiles(templatePathName)

			check(err)
			if err := os.MkdirAll(nameSpacePath, os.ModePerm); err != nil {
				log.Fatalln(err)
			}
			generatedFile, err := os.Create(outputFileName)
			check(err)
			generatedFile.WriteString("/* !!! CAUTION - THIS FILE MUST NOT BE CHANGED !!!*/\n\n")

			if err := t.Execute(generatedFile, entity); err != nil {
				log.Fatalln(err)
			} else {
				if verbose {
					log.Printf("%s successfully written", outputFileName)
				}
			}

		}

	}
	var duration = time.Now().Sub(start).Seconds()
	log.Printf("parsing %d entities and writing %d files in %f seconds.", len(project.Entities), templateCount, duration)
	return nil
}
