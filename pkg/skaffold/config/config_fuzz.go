// +build gofuzz

package config

import (
	"io/ioutil"
	"os"
)

// Fuzz tests config parsing.
func Fuzz(fuzz []byte) int {
	file, err := ioutil.TempFile("", "fuzzconfig")
	if err != nil {
		panic(err)
	}
	defer os.Remove(file.Name())
	_, err = file.Write(fuzz)
	if err != nil {
		panic(err)
	}
	err = file.Close()
	if err != nil {
		panic(err)
	}
	_, err = ReadConfigFileNoCache(file.Name())
	if err != nil {
		return 0
	}
	return 1
}
