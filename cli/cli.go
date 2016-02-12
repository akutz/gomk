package main

import (
	"fmt"

	"github.com/akutz/gomk/lib"
	"github.com/akutz/gomk/lib/core"
)

func main() {
	fmt.Printf("%d\n", lib.Sum(2, 3))
	fmt.Printf("%s\n", core.ToLower("Goodbye!"))
}
