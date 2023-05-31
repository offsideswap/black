package keeper_test

import (
	"testing"

	"github.com/stretchr/testify/assert"
	tmproto "github.com/tendermint/tendermint/proto/tendermint/types"

	blackapp "github.com/Offsideswap/blackfury/app"
)

func TestKeeper_SetValidatorWhiteList(t *testing.T) {
	app := blackapp.Setup(false)
	ctx := app.BaseApp.NewContext(false, tmproto.Header{})

	addresses := blackapp.CreateRandomAccounts(2)
	valAddresses := blackapp.ConvertAddrsToValAddrs(addresses)

	app.OracleKeeper.SetOracleWhiteList(ctx, valAddresses)

	vList := app.OracleKeeper.GetOracleWhiteList(ctx)
	assert.Equal(t, len(vList), 2)
	assert.True(t, app.OracleKeeper.ExistsOracleWhiteList(ctx))
}

func TestKeeper_ValidateAddress(t *testing.T) {
	app := blackapp.Setup(false)
	ctx := app.BaseApp.NewContext(false, tmproto.Header{})

	addresses := blackapp.CreateRandomAccounts(2)
	valAddresses := blackapp.ConvertAddrsToValAddrs(addresses)
	app.OracleKeeper.SetOracleWhiteList(ctx, valAddresses)
	assert.True(t, app.OracleKeeper.ValidateAddress(ctx, valAddresses[0]))
	assert.True(t, app.OracleKeeper.ValidateAddress(ctx, valAddresses[1]))
	addresses = blackapp.CreateRandomAccounts(3)
	valAddresses = blackapp.ConvertAddrsToValAddrs(addresses)
	assert.False(t, app.OracleKeeper.ValidateAddress(ctx, valAddresses[2]))
}
