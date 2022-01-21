package main

import "fmt"

func defaultProcessor(line []string) {
	client := defaultClientFormat{
		DNI:     line[0],
		Name:    line[1],
		Surname: line[2],
		Phone:   line[3],
	}
	fmt.Printf("DNI: %s, Name: %s, Surname: %s, Phone: %s", client.DNI, client.Name, client.Surname, client.Phone)
}

type defaultClientFormat struct {
	DNI     string
	Name    string
	Surname string
	Phone   string
}
