// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Token.sol";

contract Contest {
    Token private tokenContract;

    struct Remix {
        address creator;
        string uri;
    }

    struct Competition {
        string title;
        uint256 rewardPool;
        uint256 submissionDeadline;
        uint256[] remixIds;
        bool ended;
    }

    mapping(uint256 => Remix) public remixes;
    uint256 public remixCount = 0;

    mapping(uint256 => Competition) public competitions;
    uint256 public competitionCount = 0;

    constructor(address _tokenContract) {
        tokenContract = Token(_tokenContract);
    }

    function createCompetition(
        string memory title,
        uint256 rewardPool,
        uint256 submissionDeadline
    ) external returns (uint256) {
        require(
            submissionDeadline > block.timestamp,
            "Submission deadline should be in the future"
        );
        competitions[competitionCount++] = Competition(
            title,
            rewardPool,
            submissionDeadline,
            new uint256[](0),
            false
        );
        tokenContract.transferFrom(msg.sender, address(this), rewardPool);
        return competitionCount - 1;
    }

    function submitRemix(uint256 competitionId, string memory uri) external {
        require(competitionId < competitionCount, "Invalid competition");
        require(
            block.timestamp < competitions[competitionId].submissionDeadline,
            "Submission deadline passed"
        );
        remixes[remixCount++] = Remix(msg.sender, uri);
        competitions[competitionId].remixIds.push(remixCount - 1);
    }

    function endCompetition(
        uint256 competitionId,
        uint256[] calldata winners,
        uint256[] calldata rewards
    ) external {
        require(competitionId < competitionCount, "Invalid competition");
        require(
            block.timestamp > competitions[competitionId].submissionDeadline,
            "Submission deadline not yet passed"
        );
        require(
            !competitions[competitionId].ended,
            "Competition already ended"
        );
        require(
            winners.length == rewards.length,
            "Winners and rewards length must match"
        );

        uint256 totalRewards = 0;
        for (uint256 i = 0; i < rewards.length; i++) {
            totalRewards += rewards[i];
        }

        require(
            totalRewards <= competitions[competitionId].rewardPool,
            "Total rewards exceed the reward pool"
        );

        for (uint256 i = 0; i < winners.length; i++) {
            uint256 winnerId = winners[i];
            require(winnerId < remixCount, "Invalid winner remix");
            address winner = remixes[winnerId].creator;
            tokenContract.transfer(winner, rewards[i]);
        }

        competitions[competitionId].ended = true;
    }
}
