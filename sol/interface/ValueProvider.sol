pragma solidity ^0.5.10;

contract ValueProvider {
    function getValue(bytes32 key) public view returns (bytes32 value);
}

// Ideas for when this needs a real name:
contract DVP is ValueProvider {}  // "DValue Provider"
contract B32P is ValueProvider {} // "bytes32 provider"
