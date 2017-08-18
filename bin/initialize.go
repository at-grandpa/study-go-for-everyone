package main

import (
	"flag"
	"fmt"
	"os"
	"path"
	"regexp"
)

func main() {
	flag.Parse()
	args := flag.Args()
	if len(args) != 1 {
		fmt.Println("Too many arguments. expected: 1")
		os.Exit(1)
	}

	filePath := args[0]
	dirName := path.Dir(filePath)

	// dir
	re := regexp.MustCompile("/+$")
	if re.ReplaceAllString(filePath, "") == dirName {
		err := os.MkdirAll(dirName, 0755)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}

		fp, err := os.OpenFile(dirName+"/.gitkeep", os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0755)
		defer fp.Close()

		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}

		os.Exit(0)
	}

	// file
	err := os.MkdirAll(dirName, 0755)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	fpGitKeep, err := os.OpenFile(dirName+"/.gitkeep", os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0755)
	defer fpGitKeep.Close()

	fp, err := os.OpenFile(filePath, os.O_RDWR|os.O_CREATE|os.O_TRUNC, 0755)
	defer fp.Close()

	if err != nil {
		fmt.Println("er3")
		fmt.Println(err)
		os.Exit(1)
	}
}
