pragma solidity ^0.8.4;

contract mappingAddress{
    mapping(address => uint) public receiveMoney;
    
    function getbalnce()public view returns(uint){
        return address(this).balance;
    }
    
    function sendMoney()public payable{
        receiveMoney[msg.sender] += msg.value;
    }
    function withDrawInFraction(address payable _to,uint _amount)public {
        require(_amount <= receiveMoney[msg.sender],"You dont have enough Balance");
        receiveMoney[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    function withdrawMoney(address payable _to)public{
        uint balanceToSend = receiveMoney[msg.sender];
        receiveMoney[msg.sender] = 0;
        _to.transfer(balanceToSend);
    }
}
