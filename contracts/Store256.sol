// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Store256{
    // encodes a and b into one uint256 entity ie. z
    function encode(uint128 a, uint128 b) public pure returns(uint256 z) {
        z = uint256(a)*2**128 + uint256(b);
    }
    // decodes z into its original form ie. a, b.
    function decode(uint256 z) public pure returns(uint128 a, uint128 b) {
        uint q = z%2**128;
        z = z - q;
        b = uint128(q);
        uint p = z/2**128;
        a = uint128(p);

    }
    
}
