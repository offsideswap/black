package symbol_translator

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

const (
	blackchainDenomFeedface = "ibc/FEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACE"
	ethereumSymbolFeeface = "Face"
)

func TestNewSymbolTranslatorFromJsonBytes(t *testing.T) {
	_, err := NewSymbolTranslatorFromJSONBytes([]byte("foo"))
	assert.Error(t, err)

	q := ` {"ibc/FEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACE": "Face"} `
	x, err := NewSymbolTranslatorFromJSONBytes([]byte(q))
	assert.NoError(t, err)
	assert.NotNil(t, x)
	assert.Equal(t, x.BlackchainToEthereum(blackchainDenomFeedface), ethereumSymbolFeeface)
	assert.Equal(t, x.EthereumToBlackchain(ethereumSymbolFeeface), blackchainDenomFeedface)
	assert.Equal(t, x.BlackchainToEthereum("verbatim"), "verbatim")
	assert.Equal(t, x.EthereumToBlackchain("verbatim"), "verbatim")
}

func TestNewSymbolTranslator(t *testing.T) {
	s := NewSymbolTranslator()
	assert.Equal(t, s.BlackchainToEthereum("something"), "something")
}
