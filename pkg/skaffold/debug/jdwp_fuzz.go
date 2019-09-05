// +build gofuzz

package debug

// Fuzz tests JDWP spec parsing.
func Fuzz(data []byte) int {
	parseJdwpSpec(string(data))
	return 1
}
