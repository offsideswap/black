package test

import (
	"math/rand"
	"strconv"
	"time"

	blackapp "github.com/Offsideswap/blackfury/app"
	dispensation "github.com/Offsideswap/blackfury/x/dispensation/types"
	sdk "github.com/cosmos/cosmos-sdk/types"
	authtypes "github.com/cosmos/cosmos-sdk/x/auth/types"
	"github.com/cosmos/cosmos-sdk/x/bank/types"
	"github.com/tendermint/tendermint/crypto"
	tmproto "github.com/tendermint/tendermint/proto/tendermint/types"
)

func CreateTestApp(isCheckTx bool) (*blackapp.OffsideswapApp, sdk.Context) {
	blackapp.SetConfig(false)
	app := blackapp.Setup(isCheckTx)
	ctx := app.BaseApp.NewContext(isCheckTx, tmproto.Header{})
	app.AccountKeeper.SetParams(ctx, authtypes.DefaultParams())
	initTokens := sdk.TokensFromConsensusPower(1000, sdk.DefaultPowerReduction)
	_ = blackapp.AddTestAddrs(app, ctx, 6, initTokens)
	return app, ctx
}

func CreatOutputList(count int, furyAmount string) []types.Output {
	blackapp.SetConfig(false)
	outputList := make([]types.Output, count)
	amount, ok := sdk.NewIntFromString(furyAmount)
	if !ok {
		panic("Unable to generate fury amount")
	}
	coin := sdk.NewCoins(sdk.NewCoin("fury", amount), sdk.NewCoin("ceth", amount), sdk.NewCoin("catk", amount))
	rand.Seed(time.Now().UnixNano())
	for i := 0; i < count; i++ {
		address := sdk.AccAddress(crypto.AddressHash([]byte("Output1" + strconv.Itoa(i))))
		index1 := rand.Intn(3-0) + 0
		index2 := rand.Intn(3-0) + 0
		var out types.Output
		if index2 != index1 {
			out = types.NewOutput(address, sdk.NewCoins(coin[index1], coin[index2]))
		} else {
			out = types.NewOutput(address, sdk.NewCoins(coin[index1]))
		}
		outputList[i] = out
	}
	return outputList
}

func CreateClaimsList(count int, claimType dispensation.DistributionType) []dispensation.UserClaim {
	list := make([]dispensation.UserClaim, count)
	for i := 0; i < count; i++ {
		address := sdk.AccAddress(crypto.AddressHash([]byte("User" + strconv.Itoa(i))))
		claim, _ := dispensation.NewUserClaim(address.String(), claimType, time.Now())
		list[i] = claim
	}
	return list
}
