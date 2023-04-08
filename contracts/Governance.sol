// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Governance {
    uint256 public proposalCounter = 0;

    struct Proposal {
        uint256 id;
        address creator;
        string title;
        string description;
        uint256 votesFor;
        uint256 votesAgainst;
    }

    mapping(uint256 => Proposal) public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event ProposalCreated(
        uint256 id,
        address creator,
        string title,
        string description
    );
    event Voted(uint256 id, address voter, bool inFavor);

    function createProposal(
        string memory title,
        string memory description
    ) external {
        proposalCounter++;
        proposals[proposalCounter] = Proposal(
            proposalCounter,
            msg.sender,
            title,
            description,
            0,
            0
        );
        emit ProposalCreated(proposalCounter, msg.sender, title, description);
    }

    function vote(uint256 proposalId, bool inFavor) external {
        require(
            !hasVoted[proposalId][msg.sender],
            "Already voted on this proposal"
        );
        hasVoted[proposalId][msg.sender] = true;

        if (inFavor) {
            proposals[proposalId].votesFor++;
        } else {
            proposals[proposalId].votesAgainst++;
        }

        emit Voted(proposalId, msg.sender, inFavor);
    }

    // Implement additional functions for executing approved proposals.
}
