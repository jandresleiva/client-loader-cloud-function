// Package clientsDatabase provides a set of Cloud Functions samples.
package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"log"
	"os"
)

func main() {
	f, err := os.Open("example.csv")

	if err != nil {
		log.Fatal(err)
	}

	r := csv.NewReader(f)

	for {
		record, err := r.Read()

		if err == io.EOF {
			break
		}

		if err != nil {
			log.Fatal(err)
		}

		reader(record, defaultProcessor)
		fmt.Println("\n")
	}
}

type processor func(line []string)

func reader(line []string, processorFunction processor) {
	processorFunction(line)
}
