package lib

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestSum(t *testing.T) {
	assert.Equal(t, 3, Sum(1, 2))
}
