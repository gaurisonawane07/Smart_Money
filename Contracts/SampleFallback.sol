//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract SampleFallback {
    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public myUint;

    function setMyUint(uint _myNewUint) public {
        myUint = _myNewUint;
    }
    //0xe492fd840000000000000000000000000000000000000000000000000000000000000001

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }
    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }

}


//receive function used to receive ether and its drawback is it is only rely on 2300 gas
/*The fallback function is a special, optional function that acts as a fallback mechanism when:
The function being called does not exist in the contract.
Ether is sent to the contract with data, but there is no receive function defined.*/