// +build gofuzz

package docker

// Fuzz tests Docker image reference parsing.
func Fuzz(data []byte) int {
	if _, err := ParseReference(string(data)); err != nil {
		return 0
	}
	return 1
}
