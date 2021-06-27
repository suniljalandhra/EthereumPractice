pragma solidity ^0.8.4;



import "./Allowance.sol";



contract sharedWallet is Allowance{
    
   
    
    
   
    
    
    
    event MoneySent(address indexed _beneficiary,uint _amount);
    event MoneyReceived(address indexed _from ,uint _amount);
    
    function withdarwMoney(address payable _to,uint _amount)public ownerOrAllowed(_amount){
        require(_amount <= address(this).balance,"Contract dont have enough balance");
        if(!isOwner()){
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to,_amount);
        _to.transfer(_amount);
        
    }
    function renounceOwnership() public override onlyOwner {
        revert("can't renounceOwnership here");}
    receive() external payable{
        emit MoneyReceived(msg.sender,msg.value);
    }
}
