pragma solidity ^0.8.4;

contract functionExapmle{
    mapping(address => uint)public balanceRecevied;
    address payable public owner;
    
    constructor(){
        owner = payable(msg.sender);
    }
    function destroyContract()public{
        require(msg.sender == owner,"you're not the owner of the contract");
        selfdestruct(owner);
    }
    function viewowner()public view returns(address){
        return owner;
    }
    
    function recevieMoney()public payable{
        assert(balanceRecevied[msg.sender]+msg.value >= balanceRecevied[msg.sender]);
        balanceRecevied[msg.sender] += msg.value;
    }
    function withDrawMoney(address payable _to,uint _amount)public{
        require(balanceRecevied[msg.sender] >= _amount,"you Dont Have Enough Balance");
        assert(balanceRecevied[msg.sender] >= balanceRecevied[msg.sender] - _amount);
        balanceRecevied[msg.sender] -= _amount;
        _to.transfer(_amount);
        
    }
    function WeiToEhter(uint _wei)public pure returns(uint){
        return _wei/1 ether;
    }
      receive() external payable {
        recevieMoney();
    }
}
