//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract SimpleStorage {
    uint256 public favourateNumber;
    event StoredNumber(
        uint256 indexed oldNumber,
        uint256 indexed newNumber,
        uint256 addedNumber,
        address sender
    );

    function store(uint256 _favourateNumber) public{
        emit StoredNumber(
            favourateNumber,
            _favourateNumber,
            favourateNumber + _favourateNumber,
            msg.sender
        );
        favourateNumber = _favourateNumber;

    }
}
