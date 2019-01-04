pragma solidity ^0.4.2;
contract Election {
	// need to be able to:

	// Model a candidate i.e what it looks like, its name and id
	// Must assign to a variable to stick it in storage
	struct Candidate{
		uint id;
		string name;
		uint voteCount;
	}

	// Store candidates - Done with a mapping, like a hash....
	// id matches to the candidate structure type. This will be where it is stored

	// Fetch Candidates - From storage
	// Stored pubic so a candidates function is generated so we can fetch it
	// Storing it writes the blockchain. Interacts with the data layer
	mapping(uint => Candidate) public candidates;
	// store accounts that have voted with new mapping
	mapping(address => bool) public voters;




	// Store Candidates Count - How many candidates there are
	// why? No way to determine size or iterate over mapping in solidity and so no way of knowing how many candidates there are.
	// Counter cache used to track this. Track how many candidates in our mapping and will increment everytime we add a candidates 
	// This is used for looping. We can then find a candidate
	uint public candidatesCount;
	// list all candidates i.e multiple

	// Need to track how many votes and reference them by id

	// contructor
	function Election () public {
		// add candidates called within the functiuon so contract has control
		// will run whenever the contract is initialized and deployed to BC
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}


	// Increments the candidates count cache
	// declares a function takes in local string variable, but is a private function. So its not accessible publically and no one can add a candidate to the election
	function addCandidate (string _name) private {
		candidatesCount ++;
		// creates a candidate
		// references candidates mapping and assing in id of candidates Count
		// Assigns the value to the key mapping with the candidate function
		// passing in id, string name and initialvalue of 0 as it has no vote count
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote (uint _candidateid) public{
		// increase vote count for candidate
		// read the candidate out of the candidate mapping
		// increment the vote count in the candidate struct returned from the mapping  
		
		// reference the candidates mapping
		candidates[_candidateid].voteCount ++;
		
		// record that voeter has voted so one person per vote.
		// Person tracked via their account. This comes from solidity metadata. i.e msg.sender
		// reference the voters mapping, read the acocunt out of that mapping and set it to true 
		voters[msg.sender] = true;

	}
}

