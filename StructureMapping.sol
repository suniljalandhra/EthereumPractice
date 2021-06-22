pragma solidity ^0.8.4;

contract StructureMapping{
    struct payment{
        uint amount;
        uint timestamp;
    }
    struct balance{
        uint totalBalance;
        uint  numPaymnet;
        mapping (uint => payment) payments;
    }
    
    mapping(address => balance) public balanceReceived;
    
    
    function getBalance()public view returns(uint){
        return address(this).balance;
    }
    
    function sendMoney()public payable{
        balanceReceived[msg.sender].totalBalance += msg.value;
        payment memory Payment = payment(msg.value,block.timestamp);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPaymnet] = Payment;
        balanceReceived[msg.sender].numPaymnet++;
    }
    
    function withDrawMoney(address payable _to, uint _amount) public{
        require(balanceReceived[msg.sender].totalBalance >= _amount,"You don't have Enough Balance");
        balanceReceived[msg.sender].totalBalance -= _amount;
        
    }
    function withDrawAllMoney(address payable _to) public{
        uint balancetoSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        _to.transfer(balancetoSend);
    }
    
}
