package main

import (
	"de/drazil/ptah/structure"
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"os"
)

func main() {
	var inputfile string
	var verbose bool = false

	flag.StringVar(&inputfile, "in", "project.json", "project file")
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
}

func readJson(file string) error {
	controfile, err := os.Open(file)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println("successfully opened project file")
	defer controfile.Close()

	byteValue, _ := ioutil.ReadAll(controfile)

	var project structure.Project
	json.Unmarshal(byteValue, &project)

	return nil
}
