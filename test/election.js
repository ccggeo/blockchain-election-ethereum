// mocha and chai assertion library 

// artifact for abstraction for interaction
var Election = artifacts.require("./Election.sol");
// declare contract
// injects accounts in the dev env

// test there are two candidates
contract("Election", function(accounts) {
	var electionInstance;	

	it("initializes with two candidates", function() {
	return Election.deployed().then(function(instance) {
		return instance.candidatesCount();
	}).then(function(count) {
		assert.equal(count, 2);
	});
});
});

// test the two candidates have the correct name, id etc 
  it("it initializes the candidates with the correct values", function() {
  // gets a copy of the deployed contract
    return Election.deployed().then(function(instance) {
	//assigns it to the electionInstance variable with a scope of the whole test
      electionInstance = instance;
    // calls candidates mapping 
      return electionInstance.candidates(1);
	    //candidate passed in here and referenced via its key-mapping pair
    }).then(function(candidate) {
      assert.equal(candidate[0], 1, "contains the correct id");
      assert.equal(candidate[1], "Candidate 1", "contains the correct name");
      assert.equal(candidate[2], 0, "contains the correct votes count");
      return electionInstance.candidates(2);
    }).then(function(candidate) {
      assert.equal(candidate[0], 2, "contains the correct id");
      assert.equal(candidate[1], "Candidate 2", "contains the correct name");
      assert.equal(candidate[2], 0, "contains the correct votes count");
    });

  // vote function test
  // test function increments
  // check voter added to the created mapping

  });

	  it("allows a voter to cast a vote", function() {
    return Election.deployed().then(function(instance) {
      electionInstance = instance;
      candidateId = 1;
      return electionInstance.vote(candidateId, { from: accounts[0] });
    }).then(function(receipt) {
      return electionInstance.voters(accounts[0]);
    }).then(function(voted) {
      assert(voted, "the voter was marked as voted");
      return electionInstance.candidates(candidateId);
    }).then(function(candidate) {
      var voteCount = candidate[2];
      assert.equal(voteCount, 1, "increments the candidate's vote count");
    })
  });

