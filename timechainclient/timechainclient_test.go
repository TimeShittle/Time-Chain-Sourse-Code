// Copyright 2016 The go-TimeChain Authors
// This file is part of the go-TimeChain library.
//
// The go-TimeChain library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-TimeChain library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-TimeChain library. If not, see <http://www.gnu.org/licenses/>.

package TimeChainClient

import "github.com/TimeChain/go-TimeChain"

// Verify that Client implements the TimeChain interfaces.
var (
	_ = TimeChain.ChainReader(&Client{})
	_ = TimeChain.TransactionReader(&Client{})
	_ = TimeChain.ChainStateReader(&Client{})
	_ = TimeChain.ChainSyncReader(&Client{})
	_ = TimeChain.ContractCaller(&Client{})
	_ = TimeChain.GasEstimator(&Client{})
	_ = TimeChain.GasPricer(&Client{})
	_ = TimeChain.LogFilterer(&Client{})
	_ = TimeChain.PendingStateReader(&Client{})
	// _ = TimeChain.PendingStateEventer(&Client{})
	_ = TimeChain.PendingContractCaller(&Client{})
)
