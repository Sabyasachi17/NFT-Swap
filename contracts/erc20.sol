//compiler version 0.4.26
pragma solidity ^0.5.0;
contract Token {
    function totalSupply()public view returns (uint256 supply) {}  
    function balanceOf(address _owner)public view returns (uint256 balance) {}    
    function transfer(address _to, uint256 _value)public returns (bool success) {}
    function transferFrom(address _from, address _to, uint256 _value)public returns (bool success) {}
    function approve(address _spender, uint256 _value)public returns (bool success){}
    function allowance(address _owner, address _spender)public view returns (uint256 remaining) {}    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value); }
    
    
    contract Bitereum is Token {     
        string public name;
        uint8 public decimals;
        string public symbol;
        uint256 public unitsOneEthCanBuy;
        uint256 public totalEthInWei; 
        address public fundsWallet;
        uint256 public totalsupply;
        constructor() public 
            {  
            balances[msg.sender] = 1000000000000000000000;         
            totalsupply = 1000000000000000000000;   
            name = "Bitereum"; 
            decimals = 18;       
            symbol = "Bet";     
            unitsOneEthCanBuy = 10;         
            fundsWallet = msg.sender; 
            }
            
            function transfer(address _to, uint256 _value)public returns (bool success)
            {
            if (balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]) 
                {  
                balances[msg.sender] -= _value; 
                balances[_to] += _value; 
                emit Transfer(msg.sender, _to, _value);  
                return true;   } 
            else 
                { 
                return false; 
                
                }   
            }
            function transferFrom(address _from, address _to, uint256 _value)public returns (bool success) 
            {   
            if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && balances[_to] + _value > balances[_to]) { 
                balances[_to] += _value;    
                balances[_from] -= _value;    
                allowed[_from][msg.sender] -= _value;
                emit Transfer(_from, _to, _value);      
                return true;        } 
            else { return false; }    }
                function balanceOf(address _owner)public view returns (uint256 balance) 
                {        return balances[_owner];
                }
                function approve(address _spender, uint256 _value)public returns (bool success) 
                {
                    allowed[msg.sender][_spender] = _value; 
                    emit Approval(msg.sender, _spender, _value); 
                    return true;    
                    
                }
                function allowance(address _owner, address _spender)public view returns (uint256 remaining) 
                {      
                    return allowed[_owner][_spender];    
                    
                }
                mapping (address => uint256) balances;
                mapping (address => mapping (address => uint256)) allowed;
                function totalSupply() public view returns (uint256 supply) 
                {
                    return totalsupply;
                }
                
                  }


