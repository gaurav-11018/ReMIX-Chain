// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract Voting {
    IERC721 public remixNFTContract;

    struct Vote {
        address voter;
        uint256 competitionId;
    }

    mapping(uint256 => Vote[]) public votesByRemix;
    mapping(uint256 => mapping(address => bool)) public hasVotedInCompetition;

    event Voted(
        address indexed voter,
        uint256 indexed competitionId,
        uint256 indexed remixId
    );
    event WinnersDetermined(
        uint256 indexed competitionId,
        uint256[] indexed winners
    );

    constructor(address _remixNFTContract) {
        remixNFTContract = IERC721(_remixNFTContract);
    }

    function voteForRemix(uint256 competitionId, uint256 remixId) external {
        require(
            !hasVotedInCompetition[competitionId][msg.sender],
            "Already voted in this competition"
        );
        require(
            remixNFTContract.ownerOf(remixId) != address(0),
            "Invalid remix"
        );

        votesByRemix[remixId].push(Vote(msg.sender, competitionId));
        hasVotedInCompetition[competitionId][msg.sender] = true;

        emit Voted(msg.sender, competitionId, remixId);
    }

    function getVoteCount(uint256 remixId) external view returns (uint256) {
        return votesByRemix[remixId].length;
    }

    function getWinners(
        uint256 competitionId,
        uint256[] calldata remixIds,
        uint256 topN
    ) external returns (uint256[] memory) {
        require(
            remixIds.length >= topN,
            "Not enough remixes for the specified topN"
        );

        uint256[] memory winners = new uint256[](topN);
        uint256[] memory winnerVoteCounts = new uint256[](topN);

        for (uint256 i = 0; i < remixIds.length; i++) {
            uint256 currentRemixId = remixIds[i];
            uint256 currentVoteCount = votesByRemix[currentRemixId].length;

            for (uint256 j = 0; j < topN; j++) {
                if (currentVoteCount > winnerVoteCounts[j]) {
                    for (uint256 k = topN - 1; k > j; k--) {
                        winners[k] = winners[k - 1];
                        winnerVoteCounts[k] = winnerVoteCounts[k - 1];
                    }
                    winners[j] = currentRemixId;
                    winnerVoteCounts[j] = currentVoteCount;
                    break;
                }
            }
        }

        emit WinnersDetermined(competitionId, winners);
        return winners;
    }
}
