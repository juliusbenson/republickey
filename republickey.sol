{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf460
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 /*\
 * Authors: M.J.Meier, J.S.Benson, R.K.Johnson\
 * RepublicKey contract will allow votes to be set and counted and the winning\
 *              proposal can be obtained.\
 */\
contract RepublicKey\
\{\
    string public proposalWinner;\
    Vote[] public votes;\
    uint public numberOfVoters;\
    CountOfProposal[] public proposals;\
    \
    struct Vote \{\
        address voterHash;\
        string proposalVotedOn;\
    \} \
    \
    struct CountOfProposal \{\
        string proposalVotedOn;\
        uint numberOfVotes;\
    \}\
    \
    /*\
     * Constructor\
     */\
    function RepublicKey()\
    \{\
        numberOfVoters = 0;\
        proposalWinner = '';\
        \
    \}\
    \
    /*\
     * Set - Will set the voterHash and the proposal string they voted on in\
     *      the votes array.\
     */\
    function Set(address voterHash, string proposalVotedOn)\
    \{\
        // This checks if voter has already voted\
        for (uint i = 0; i < numberOfVoters; i++) \{\
            if (votes[i].voterHash == voterHash) \{\
                return;\
            \}\
        \}\
        \
        votes[numberOfVoters] = Vote(\{\
            voterHash: voterHash,\
            proposalVotedOn: proposalVotedOn\
        \});\
        numberOfVoters++;\
    \}\
    \
    /*\
     * Get - Simply gets the proposal winner string run by the Count function.\
     */\
    function Get()\
    returns (string proposalWinner)\
    \{\
        return proposalWinner;\
    \}\
    \
    //Not done with this function yet..\
    function Count()\
    \{\
        uint numberOfProposals = 0;\
        for (uint i = 0; i < numberOfVoters; i++) \{\
            //proposals[numberOfProposals] = \
        \}\
    \}\
\}}