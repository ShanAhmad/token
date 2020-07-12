pragma solidity >=0.4.2;

contract LikonToken{
    string public name = "LIKON Token"; // Name of the Token
    string public symbol = "LIK"; // Symbol of Likon
    string public standard = "LIKON Token v1.0"; // Standard of Token 
    uint256 public totalSupply; // State Variable stored in blockchain

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    // approve
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );


    mapping(address => uint256) public balanceOf; // hash table
    mapping(address => mapping(address => uint256)) public allowance; //nested Mapping

    // Constructor
    function LikonToken (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply; //assigning tokens to the admin block 
        totalSupply = _initialSupply; // Dynamically assigning total number of tokens
    }

    // Transfer function
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        Transfer(msg.sender, _to, _value);

        return true;
    }

    // approve
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        Transfer(_from, _to, _value);

        return true;
    }
}