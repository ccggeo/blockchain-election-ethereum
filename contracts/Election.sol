pragma solidity ^0.4.2;

contract Election {
	// smoke test - ensure the setup is correct 
	//constructor - something that will run when the contract is initialized on migration
	// set the value of a variable - i.e a candidate name
	// To do this nees to be able to store and read candidate name 
	// will run whenever contract deployed to bc - therefore its public
	
	// state variable, accessible inside the contract, though will belong to the entire contract
	// 	
	string public candidate;
	function Election () public {
		candidate = "Candidate 1";	
	}



}
