// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SSS.sol";
import {ITokenMock} from "@crytic/properties/contracts/ERC20/external/util/ITokenMock.sol";
import {CryticERC20ExternalBasicProperties} from "@crytic/properties/contracts/ERC20/external/properties/ERC20ExternalBasicProperties.sol";
import {PropertiesConstants} from "@crytic/properties/contracts/util/PropertiesConstants.sol";


contract CryticERC20ExternalHarness is CryticERC20ExternalBasicProperties {
    constructor() {
        // Deploy ERC20
        token = ITokenMock(address(new CryticTokenMock()));
    }
}

contract CryticTokenMock is SSS, PropertiesConstants {
    bool public isMintableOrBurnable;
    uint256 public initialSupply;

    constructor() SSS(
        address(69),
        address(69),
        address(69),
        address(69),
        address(69),
        address(69),
        address(69),
        3600,
        3600
        ){
            _mint(USER1, INITIAL_BALANCE);
            _mint(USER2, INITIAL_BALANCE);
            _mint(USER3, INITIAL_BALANCE);
            _mint(msg.sender, INITIAL_BALANCE);

            initialSupply = totalSupply();
            isMintableOrBurnable = true;
    }
}