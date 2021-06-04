// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
  address public minter;

  //adicionar evento de alteração de minter(Criador)
  event MinterChanged(address indexed from, address to);

  constructor() public payable ERC20("Decentralized Bank Currency", "DBC") {
    minter =  msg.sender;
  }

  //Add pass minter role function

  function passMinterRole(address dBank) public returns (bool)
  {

    require(msg.sender == minter, 'Erro. accesso negado');
    minter = dBank;

    emit MinterChanged(msg.sender,dBank);
    return  true;
  }

  function mint(address account, uint256 amount) public {
    //verifique se msg.sender tem função de minter

    require(msg.sender == minter, 'Erro, permissao negada');
		_mint(account, amount);
	}
}