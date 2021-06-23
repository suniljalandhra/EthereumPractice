pragma solidity ^0.8.4;

contract MyAssert{
    mapping (address => uint64)public BalanceRecieved;
    
    
    function recevieMoney()public payable{
        BalanceRecieved[msg.sender] += uint64(msg.value);
    }
    
    function withDrawMoney(address payable _to,uint64 _amount)public{
        require(BalanceRecieved[msg.sender] >= _amount,"You Dont have Enough funds");
        BalanceRecieved[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
