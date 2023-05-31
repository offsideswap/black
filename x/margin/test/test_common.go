package test

import (
	sdk "github.com/cosmos/cosmos-sdk/types"
	authtypes "github.com/cosmos/cosmos-sdk/x/auth/types"
	tmproto "github.com/tendermint/tendermint/proto/tendermint/types"

	blackapp "github.com/Blackchain/blackfury/app"
)

func CreateTestApp(isCheckTx bool) (*blackapp.BlackchainApp, sdk.Context) {
	app := blackapp.Setup(isCheckTx)
	ctx := app.BaseApp.NewContext(isCheckTx, tmproto.Header{})
	app.AccountKeeper.SetParams(ctx, authtypes.DefaultParams())
	initTokens := sdk.TokensFromConsensusPower(1000, sdk.DefaultPowerReduction)
	_ = blackapp.AddTestAddrs(app, ctx, 6, initTokens)
	return app, ctx
}

func CreateTestAppMargin(isCheckTx bool) (sdk.Context, *blackapp.BlackchainApp) {
	blackapp.SetConfig((false))
	app := blackapp.Setup(isCheckTx)
	ctx := app.BaseApp.NewContext(isCheckTx, tmproto.Header{})
	return ctx, app
}

func CreateTestAppMarginFromGenesis(isCheckTx bool, genesisTransformer func(*blackapp.BlackchainApp, blackapp.GenesisState) blackapp.GenesisState) (sdk.Context, *blackapp.BlackchainApp) {
	blackapp.SetConfig(false)
	app := blackapp.SetupFromGenesis(isCheckTx, genesisTransformer)
	ctx := app.BaseApp.NewContext(isCheckTx, tmproto.Header{})
	return ctx, app
}
