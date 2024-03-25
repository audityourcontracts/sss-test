// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import "../../src/SSS.sol";

contract SSSTest is Test {
    SSS sss;
    ERC20 sss20;

    function setUp() public {
        sss = new SSS(
            address(69),
            address(69),
            address(69),
            address(69),
            address(69),
            address(69),
            address(69),
            3600,
            3600
        );

        sss20 = ERC20(sss);

        // Make sure the test address has no tokens.
        assertEq(sss20.balanceOf(address(100)), 0);
        // Transfer the test account 1 token.
        sss20.transfer(address(100), 1);
    }

    function test_Foundry_selfTransfer() public {
        // setUp() gives address(100) 1 token.

        // As address(100)
        vm.prank(address(100));
        sss20.transfer(address(100), 1); // Transfer 1 token to yourself.

        //console2.log("Balance", sss20.balanceOf(address(100))); // The balance will be two.
        assertEq(sss20.balanceOf(address(100)), 1);
    }

    function test_Foundry_selfTransferFrom() public {
        // setUp() gives address(100) 1 token.

        vm.prank(address(100));
        sss20.approve(address(1337), 1);

        vm.prank(address(1337));
        sss20.transferFrom(address(100), address(100), 1);

        assertEq(sss20.balanceOf(address(100)), 1);
    }
}
