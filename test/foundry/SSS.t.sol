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
    }

    function testTransfer() public {
        console2.log("Deployer balance", sss20.balanceOf(address(this)));
        // Transfer some to address(100) so they can perform the test.
        sss20.transfer(address(100), 10 ether);
        assertEq(sss20.balanceOf(address(100)), 10 ether);

        // As address(100)
        vm.prank(address(100));
        sss20.transfer(address(100), 10 ether);
        assertEq(sss20.balanceOf(address(100)), 20 ether);
    }
}
