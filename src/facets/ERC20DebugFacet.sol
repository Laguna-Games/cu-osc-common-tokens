// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {LibTestnetDebugInterface} from "../../lib/cu-osc-common/src/libraries/LibTestnetDebugInterface.sol";
import {LibERC20} from "../libraries/LibERC20.sol";
import {LibValidate} from "../../lib/cu-osc-common/src/libraries/LibValidate.sol";
import {LibContractOwner} from "../../lib/cu-osc-diamond-template/src/libraries/LibContractOwner.sol";
import {LibEnvironment} from "../../lib/cu-osc-common/src/libraries/LibEnvironment.sol";

/// @title Debug Facet for ERC20 Tokens
/// @dev This facet is intended to be used on Arbitrum-Sepolia, Xai-Sepolia, and localhost networks ONLY!
contract ERC20DebugFacet {
    function debugMint(address receiver, uint256 amount) external {
        LibTestnetDebugInterface.enforceDebugger();
        LibERC20.mint(receiver, amount);
    }

    function debugBurn(uint256 amount) external {
        LibTestnetDebugInterface.enforceDebugger();
        LibERC20.burn(msg.sender, amount);
    }
}
