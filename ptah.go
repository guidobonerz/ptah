package main

import (
	"de/drazil/ptah/structure"
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
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

	for _, target := range project.Targets {
		for _, entity := range project.Entities {
			var outputFileName = "results/" + entity.Name + "." + target.Suffix
			var templateFileName = entity.Type + ".go.tpl"
			var templatePathName = "templates/" + target.Name + "/" + target.Type + "/" + templateFileName

			t, err := template.New(templateFileName).Funcs(template.FuncMap{
				"minus": func(a, b int) int {
					return a - b
				}, "getDataType": func(key string) string {
					var result structure.DataType
					var list []structure.DataType = target.DataTypes
					for i := 0; i < len(list); i++ {
						if list[i].GenericType == key {
							result = list[i]
							break
						}
					}
					return result.RealType
				}, "getPrimaryKeyString": func() string {
					var pk string
					var list []structure.Attribute = entity.Attributes
					for i := 0; i < len(list); i++ {
						if list[i].PrimaryKey {
							pk += list[i].Name + ","
						}
					}
					pk = pk[:len(pk)-1]
					return pk
				}}).ParseFiles(templatePathName)

			if err != nil {
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

	return nil
}
