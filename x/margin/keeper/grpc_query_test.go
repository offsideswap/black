package keeper_test

import (
	"testing"

	"github.com/Blackchain/blackfury/x/margin/keeper"
	"github.com/Blackchain/blackfury/x/margin/test"
	margintypes "github.com/Blackchain/blackfury/x/margin/types"
	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/stretchr/testify/require"
)

func TestKeeper_NewQueryServer(t *testing.T) {
	ctx, app := test.CreateTestAppMargin(false)

	addMTPKey(t, ctx, app, app.MarginKeeper, "ceth", "fury", "black1syavy2npfyt9tcncdtsdzf7kny9lh777yqc2nd", margintypes.Position_LONG, 1, sdk.NewDec(20))

	queryServer := keeper.NewQueryServer(app.MarginKeeper)

	res, err := queryServer.GetPositionsForAddress(sdk.WrapSDKContext(ctx), &margintypes.PositionsForAddressRequest{
		Address:    "black1syavy2npfyt9tcncdtsdzf7kny9lh777yqc2nd",
		Pagination: nil,
	})
	require.NoError(t, err)
	require.Len(t, res.Mtps, 1)
}
