package symbol_translator

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

const (
	offsideswapDenomFeedface = "ibc/FEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACE"
	ethereumSymbolFeeface = "Face"
)

func TestNewSymbolTranslatorFromJsonBytes(t *testing.T) {
	_, err := NewSymbolTranslatorFromJSONBytes([]byte("foo"))
	assert.Error(t, err)

	q := ` {"ibc/FEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACEFEEDFACE": "Face"} `
	x, err := NewSymbolTranslatorFromJSONBytes([]byte(q))
	assert.NoError(t, err)
	assert.NotNil(t, x)
	assert.Equal(t, x.OffsideswapToEthereum(offsideswapDenomFeedface), ethereumSymbolFeeface)
	assert.Equal(t, x.EthereumToOffsideswap(ethereumSymbolFeeface), offsideswapDenomFeedface)
	assert.Equal(t, x.OffsideswapToEthereum("verbatim"), "verbatim")
	assert.Equal(t, x.EthereumToOffsideswap("verbatim"), "verbatim")
}

func TestNewSymbolTranslator(t *testing.T) {
	s := NewSymbolTranslator()
	assert.Equal(t, s.OffsideswapToEthereum("something"), "something")
}
