// Code generated by MockGen. DO NOT EDIT.
// Source: ../expected_keepers.go

// Package tokenregistrymocks is a generated GoMock package.
package tokenregistrymocks

import (
	reflect "reflect"

	types "github.com/Blackchain/blackfury/x/tokenregistry/types"
	types0 "github.com/cosmos/cosmos-sdk/types"
	gomock "github.com/golang/mock/gomock"
	types1 "github.com/tendermint/tendermint/abci/types"
)

// MockKeeper is a mock of Keeper interface.
type MockKeeper struct {
	ctrl     *gomock.Controller
	recorder *MockKeeperMockRecorder
}

// MockKeeperMockRecorder is the mock recorder for MockKeeper.
type MockKeeperMockRecorder struct {
	mock *MockKeeper
}

// NewMockKeeper creates a new mock instance.
func NewMockKeeper(ctrl *gomock.Controller) *MockKeeper {
	mock := &MockKeeper{ctrl: ctrl}
	mock.recorder = &MockKeeperMockRecorder{mock}
	return mock
}

// EXPECT returns an object that allows the caller to indicate expected use.
func (m *MockKeeper) EXPECT() *MockKeeperMockRecorder {
	return m.recorder
}

// CheckEntryPermissions mocks base method.
func (m *MockKeeper) CheckEntryPermissions(entry *types.RegistryEntry, permissions []types.Permission) bool {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CheckEntryPermissions", entry, permissions)
	ret0, _ := ret[0].(bool)
	return ret0
}

// CheckEntryPermissions indicates an expected call of CheckEntryPermissions.
func (mr *MockKeeperMockRecorder) CheckEntryPermissions(entry, permissions interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CheckEntryPermissions", reflect.TypeOf((*MockKeeper)(nil).CheckEntryPermissions), entry, permissions)
}

// ExportGenesis mocks base method.
func (m *MockKeeper) ExportGenesis(ctx types0.Context) *types.GenesisState {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "ExportGenesis", ctx)
	ret0, _ := ret[0].(*types.GenesisState)
	return ret0
}

// ExportGenesis indicates an expected call of ExportGenesis.
func (mr *MockKeeperMockRecorder) ExportGenesis(ctx interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "ExportGenesis", reflect.TypeOf((*MockKeeper)(nil).ExportGenesis), ctx)
}

// GetEntry mocks base method.
func (m *MockKeeper) GetEntry(registry types.Registry, denom string) (*types.RegistryEntry, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetEntry", registry, denom)
	ret0, _ := ret[0].(*types.RegistryEntry)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// GetEntry indicates an expected call of GetEntry.
func (mr *MockKeeperMockRecorder) GetEntry(registry, denom interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetEntry", reflect.TypeOf((*MockKeeper)(nil).GetEntry), registry, denom)
}

// GetRegistry mocks base method.
func (m *MockKeeper) GetRegistry(ctx types0.Context) types.Registry {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetRegistry", ctx)
	ret0, _ := ret[0].(types.Registry)
	return ret0
}

// GetRegistry indicates an expected call of GetRegistry.
func (mr *MockKeeperMockRecorder) GetRegistry(ctx interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetRegistry", reflect.TypeOf((*MockKeeper)(nil).GetRegistry), ctx)
}

// InitGenesis mocks base method.
func (m *MockKeeper) InitGenesis(ctx types0.Context, state types.GenesisState) []types1.ValidatorUpdate {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "InitGenesis", ctx, state)
	ret0, _ := ret[0].([]types1.ValidatorUpdate)
	return ret0
}

// InitGenesis indicates an expected call of InitGenesis.
func (mr *MockKeeperMockRecorder) InitGenesis(ctx, state interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "InitGenesis", reflect.TypeOf((*MockKeeper)(nil).InitGenesis), ctx, state)
}

// IsAdminAccount mocks base method.
func (m *MockKeeper) IsAdminAccount(ctx types0.Context, adminAccount types0.AccAddress) bool {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "IsAdminAccount", ctx, adminAccount)
	ret0, _ := ret[0].(bool)
	return ret0
}

// IsAdminAccount indicates an expected call of IsAdminAccount.
func (mr *MockKeeperMockRecorder) IsAdminAccount(ctx, adminAccount interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "IsAdminAccount", reflect.TypeOf((*MockKeeper)(nil).IsAdminAccount), ctx, adminAccount)
}

// RemoveToken mocks base method.
func (m *MockKeeper) RemoveToken(ctx types0.Context, denom string) {
	m.ctrl.T.Helper()
	m.ctrl.Call(m, "RemoveToken", ctx, denom)
}

// RemoveToken indicates an expected call of RemoveToken.
func (mr *MockKeeperMockRecorder) RemoveToken(ctx, denom interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "RemoveToken", reflect.TypeOf((*MockKeeper)(nil).RemoveToken), ctx, denom)
}

// SetAdminAccount mocks base method.
func (m *MockKeeper) SetAdminAccount(ctx types0.Context, adminAccount types0.AccAddress) {
	m.ctrl.T.Helper()
	m.ctrl.Call(m, "SetAdminAccount", ctx, adminAccount)
}

// SetAdminAccount indicates an expected call of SetAdminAccount.
func (mr *MockKeeperMockRecorder) SetAdminAccount(ctx, adminAccount interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "SetAdminAccount", reflect.TypeOf((*MockKeeper)(nil).SetAdminAccount), ctx, adminAccount)
}

// SetToken mocks base method.
func (m *MockKeeper) SetToken(ctx types0.Context, entry *types.RegistryEntry) {
	m.ctrl.T.Helper()
	m.ctrl.Call(m, "SetToken", ctx, entry)
}

// SetToken indicates an expected call of SetToken.
func (mr *MockKeeperMockRecorder) SetToken(ctx, entry interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "SetToken", reflect.TypeOf((*MockKeeper)(nil).SetToken), ctx, entry)
}
