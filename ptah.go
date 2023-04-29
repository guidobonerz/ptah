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
)

func main() {
	var inputfile string
	var verbose bool = false

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
	parseTemplate(inputfile)
}

func parseTemplate(file string) error {
	controlFile, err := os.Open(file)
	if err != nil {
		log.Fatalln(err)
	}

	fmt.Println("successfully opened project file")
	defer controlFile.Close()

	byteValue, _ := ioutil.ReadAll(controlFile)

	var project structure.Project
	json.Unmarshal(byteValue, &project)

	for _, templateConfig := range project.TemplateConfigurations {
		for _, tmpl := range templateConfig.Templates {
			if tmpl.Enabled {
				for _, entity := range project.Entities {
					var nameSpacePath = "results/" + strings.Replace(project.BaseNameSpace+"."+tmpl.NameSpace, ".", "/", -1)
					var outputFileName = nameSpacePath + "/" + fmt.Sprintf(tmpl.NamePattern, strings.Title(entity.Name)) + "." + templateConfig.Suffix
					var templateFileName = tmpl.Name + ".go.tpl"
					var templatePathName = "templates/" + templateConfig.TemplateBasePath + templateFileName
					t, err := template.New(templateFileName).Funcs(template.FuncMap{
						"getNameSpace": func() string {
							return project.BaseNameSpace + "." + tmpl.NameSpace
						},
						"getTemplateName": func() string {
							return tmpl.Name
						},
						"getObjectName": func() string {
							return fmt.Sprintf(tmpl.NamePattern, strings.Title(entity.Name))
						},
						"isNotLastAttribute": func(index int) bool {
							return len(entity.Attributes)-1 != index
						},
						"getDataType": func(key string) string {
							return templateConfig.DataTypes[key].DataType
						},
						"getUpperCaseName": func(name string) string {
							return strings.ToUpper(name)
						},
						"getTitleCaseName": func(name string) string {
							return strings.Title(name)
						},
						"getCamelCaseName": func(name string) string {
							return strings.ToTitle(name)
						},
						"getPrimaryKeyString": func() string {
							var pk string
							var list []structure.Attribute = entity.Attributes
							for i := 0; i < len(list); i++ {
								if list[i].PrimaryKey {
									pk += list[i].Name + ","
								}
							}
							pk = pk[:len(pk)-1]
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

					if err != nil {
						log.Fatalln(err)
					}
					if err := os.MkdirAll(nameSpacePath, os.ModePerm); err != nil {
						log.Fatalln(err)
					}
					generatedFile, err := os.Create(outputFileName)
					if err != nil {
						log.Fatalln(err)
					}

					if err := t.Execute(generatedFile, entity); err != nil {
						log.Fatalln(err)
					}
				}
			}
		}
	}
	return nil
}

/*

,
                {
                    "name": "view",
                    "outputPath": "",
                    "fileNamePattern": ""
                },
                {
                    "name": "procedure",
                    "outputPath": "",
                    "fileNamePattern": ""
                }






*/
