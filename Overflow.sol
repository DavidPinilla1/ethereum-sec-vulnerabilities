pragma solidity ^0.4.10;

contract Overflow{

    mapping (address=>uint) balances;

    function contribute () payable {
        balances[msg.sender] = msg.value;
    }
    function getBalance() returns (uint){
        return balances[msg.sender];
    }
    //the following method is the one that caused the vulneravility
    function batchSend (address[] receivers, uint _value){
        //this line overflows whenever the total it's 0 the tx is free which caused hyperinflation in some ERC20 tokens in the past
        uint total = _receivers.length * _value;
        //so if total is 0 you can send the amount you wish
        require(balances[msg.sender]>= total);
        //substract from sender (obviously)
        balances[msg.sender] =balances[msg.sender] - total;

        for(uint i=0;i<_receivers.length;i++){
            balances[_receiver[i]] = balances[_receiver[i]] +_value
        }
    }
}