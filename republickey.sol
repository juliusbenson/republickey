/*
 * Authors: M.J.Meier, J.S.Benson, R.K.Johnson
 * RepublicKey contract will allow votes to be set and counted and the winning
 *              proposal can be obtained.
 */
contract RepublicKey
{
    bytes32 private emptyHash;
    bytes32 private hProposalWinner;
    uint private numberOfVoters;
    address[] private listOfVoters;
    
    // votes are the hash of the voters as the key,
    // and the value is the hash of the proposal.
    mapping (address => bytes32) votes;
    
    // proposals are the hash of the proposal as the key,
    // and the value is the number of votes for it.
    mapping (bytes32 => uint) proposals;

    /*
     * Constructor
     */
    function RepublicKey()
    {
        numberOfVoters = 2;
        hProposalWinner = emptyHash;
        listOfVoters[0] = 0xc3453546fA7d38be9FceCAE590243CC4B85fdF28;
        listOfVoters[1] = 0x5065E18c3Fa4e7BB4f125689Aff461bB40Bf9cBc;
        
        for (uint i = 0; i < numberOfVoters; i++) {
            votes[listOfVoters[0]] = emptyHash;
        }
    }
    
    /*
     * Set - Will set the voterHash and the proposal string they voted on in
     *      the votes array.
     */
    function Set(bytes32 proposalVotedOn)
    {
        // This checks if the voter can vote
        for (uint i = 0; i < numberOfVoters; i++) {
            if (listOfVoters[i] == msg.sender) {
                break;
            }
            
            if (i == numberOfVoters - 1) {
                return;
            }
        }
        
        // This checks if voter has already voted
        if (votes[msg.sender] != emptyHash) {
            return;
        }
        
        votes[msg.sender] = proposalVotedOn;
    }
    
    /*
     * Get - Simply gets the proposal winner string run by the Count function.
     */
    function Get()
    returns (bytes32 proposalWinner)
    {
        return hProposalWinner;
    }
    
    //Not done with this function yet..
    function Count()
    {
        
    }
}
