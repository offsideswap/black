package keeper_test

import (
	"testing"

	blackapp "github.com/Blackchain/blackfury/app"

	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/stretchr/testify/require"

	"github.com/Blackchain/blackfury/x/clp/test"
	"github.com/Blackchain/blackfury/x/clp/types"
	banktypes "github.com/cosmos/cosmos-sdk/x/bank/types"
)

func TestKeeper_SetPmtpEpoch(t *testing.T) {
	const address = "black1syavy2npfyt9tcncdtsdzf7kny9lh777yqc2nd"
	const poolAsset = "eth"
	nativeBalance := sdk.NewInt(10000)
	externalBalance := sdk.NewInt(10000)

	ctx, app := test.CreateTestAppClpFromGenesis(false, func(app *blackapp.BlackchainApp, genesisState blackapp.GenesisState) blackapp.GenesisState {
		balances := []banktypes.Balance{
			{
				Address: address,
				Coins: sdk.Coins{
					sdk.NewCoin(poolAsset, externalBalance),
					sdk.NewCoin("fury", nativeBalance),
				},
			},
		}
		bankGs := banktypes.DefaultGenesisState()
		bankGs.Balances = append(bankGs.Balances, balances...)
		bz, _ := app.AppCodec().MarshalJSON(bankGs)
		genesisState["bank"] = bz

		return genesisState
	})

	params := types.PmtpEpoch{
		EpochCounter: 1000,
		BlockCounter: 1000,
	}

	app.ClpKeeper.SetPmtpEpoch(ctx, params)

	got := app.ClpKeeper.GetPmtpEpoch(ctx)

	require.Equal(t, got, types.PmtpEpoch{
		EpochCounter: 1000,
		BlockCounter: 1000,
	})
}

func TestKeeper_DecrementPmtpEpochCounter(t *testing.T) {
	const address = "black1syavy2npfyt9tcncdtsdzf7kny9lh777yqc2nd"
	const poolAsset = "eth"
	nativeBalance := sdk.NewInt(10000)
	externalBalance := sdk.NewInt(10000)

	ctx, app := test.CreateTestAppClpFromGenesis(false, func(app *blackapp.BlackchainApp, genesisState blackapp.GenesisState) blackapp.GenesisState {
		balances := []banktypes.Balance{
			{
				Address: address,
				Coins: sdk.Coins{
					sdk.NewCoin(poolAsset, externalBalance),
					sdk.NewCoin("fury", nativeBalance),
				},
			},
		}
		bankGs := banktypes.DefaultGenesisState()
		bankGs.Balances = append(bankGs.Balances, balances...)
		bz, _ := app.AppCodec().MarshalJSON(bankGs)
		genesisState["bank"] = bz

		return genesisState
	})

	params := types.PmtpEpoch{
		EpochCounter: 1000,
		BlockCounter: 1000,
	}

	app.ClpKeeper.SetPmtpEpoch(ctx, params)

	app.ClpKeeper.DecrementPmtpEpochCounter(ctx)

	got := app.ClpKeeper.GetPmtpEpoch(ctx)

	require.Equal(t, got, types.PmtpEpoch{
		EpochCounter: 999,
		BlockCounter: 1000,
	})
}

func TestKeeper_DecrementPmtpBlockCounter(t *testing.T) {
	const address = "black1syavy2npfyt9tcncdtsdzf7kny9lh777yqc2nd"
	const poolAsset = "eth"
	nativeBalance := sdk.NewInt(10000)
	externalBalance := sdk.NewInt(10000)

	ctx, app := test.CreateTestAppClpFromGenesis(false, func(app *blackapp.BlackchainApp, genesisState blackapp.GenesisState) blackapp.GenesisState {
		balances := []banktypes.Balance{
			{
				Address: address,
				Coins: sdk.Coins{
					sdk.NewCoin(poolAsset, externalBalance),
					sdk.NewCoin("fury", nativeBalance),
				},
			},
		}
		bankGs := banktypes.DefaultGenesisState()
		bankGs.Balances = append(bankGs.Balances, balances...)
		bz, _ := app.AppCodec().MarshalJSON(bankGs)
		genesisState["bank"] = bz

		return genesisState
	})

	params := types.PmtpEpoch{
		EpochCounter: 1000,
		BlockCounter: 1000,
	}

	app.ClpKeeper.SetPmtpEpoch(ctx, params)

	app.ClpKeeper.DecrementPmtpBlockCounter(ctx)

	got := app.ClpKeeper.GetPmtpEpoch(ctx)

	require.Equal(t, got, types.PmtpEpoch{
		EpochCounter: 1000,
		BlockCounter: 999,
	})
}

func TestKeeper_SetPmtpBlockCounter(t *testing.T) {
	const address = "black1syavy2npfyt9tcncdtsdzf7kny9lh777yqc2nd"
	const poolAsset = "eth"
	nativeBalance := sdk.NewInt(10000)
	externalBalance := sdk.NewInt(10000)

	ctx, app := test.CreateTestAppClpFromGenesis(false, func(app *blackapp.BlackchainApp, genesisState blackapp.GenesisState) blackapp.GenesisState {
		balances := []banktypes.Balance{
			{
				Address: address,
				Coins: sdk.Coins{
					sdk.NewCoin(poolAsset, externalBalance),
					sdk.NewCoin("fury", nativeBalance),
				},
			},
		}
		bankGs := banktypes.DefaultGenesisState()
		bankGs.Balances = append(bankGs.Balances, balances...)
		bz, _ := app.AppCodec().MarshalJSON(bankGs)
		genesisState["bank"] = bz

		return genesisState
	})

	params := types.PmtpEpoch{
		EpochCounter: 1000,
		BlockCounter: 1000,
	}

	app.ClpKeeper.SetPmtpEpoch(ctx, params)

	app.ClpKeeper.SetPmtpBlockCounter(ctx, 2000)

	got := app.ClpKeeper.GetPmtpEpoch(ctx)

	require.Equal(t, got, types.PmtpEpoch{
		EpochCounter: 1000,
		BlockCounter: 2000,
	})
}
