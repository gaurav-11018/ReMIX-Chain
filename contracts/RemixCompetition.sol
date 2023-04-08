// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract RemixCompetition {
    struct Competition {
        uint256 id;
        address creator;
        string trackName;
        string[] stems;
        uint256 submissionDeadline;
        uint256 votingDeadline;
        uint256 rewardAmount;
        bool isActive;
    }

    IERC20 public rcxToken;
    IERC721 public nftContract;

    uint256 private nextCompetitionId;
    mapping(uint256 => Competition) public competitions;
    mapping(uint256 => uint256[]) public remixEntries;
    mapping(uint256 => uint256) public remixVotes;

    event NewCompetition(
        uint256 indexed competitionId,
        address indexed creator
    );
    event NewRemix(
        uint256 indexed competitionId,
        uint256 indexed remixId,
        address indexed submitter
    );
    event Vote(
        uint256 indexed competitionId,
        uint256 indexed remixId,
        address indexed voter
    );

    constructor(address _rcxToken, address _nftContract) {
        rcxToken = IERC20(_rcxToken);
        nftContract = IERC721(_nftContract);
    }

    function createCompetition(
        string memory _trackName,
        string[] memory _stems,
        uint256 _submissionDeadline,
        uint256 _votingDeadline,
        uint256 _rewardAmount
    ) external {
        require(
            _submissionDeadline > block.timestamp,
            "Invalid submission deadline"
        );
        require(
            _votingDeadline > _submissionDeadline,
            "Invalid voting deadline"
        );

        uint256 competitionId = nextCompetitionId++;

        Competition storage competition = competitions[competitionId];
        competition.id = competitionId;
        competition.creator = msg.sender;
        competition.trackName = _trackName;
        competition.stems = _stems;
        competition.submissionDeadline = _submissionDeadline;
        competition.votingDeadline = _votingDeadline;
        competition.rewardAmount = _rewardAmount;
        competition.isActive = true;

        emit NewCompetition(competitionId, msg.sender);
    }

    function submitRemix(uint256 _competitionId, uint256 _remixId) external {
        Competition storage competition = competitions[_competitionId];
        require(competition.isActive, "Competition is not active");
        require(
            block.timestamp <= competition.submissionDeadline,
            "Submission deadline passed"
        );

        remixEntries[_competitionId].push(_remixId);

        emit NewRemix(_competitionId, _remixId, msg.sender);
    }

    function vote(uint256 _competitionId, uint256 _remixId) external {
        Competition storage competition = competitions[_competitionId];
        require(competition.isActive, "Competition is not active");
        require(
            block.timestamp > competition.submissionDeadline &&
                block.timestamp <= competition.votingDeadline,
            "Voting period not active"
        );

        remixVotes[_remixId]++;

        emit Vote(_competitionId, _remixId, msg.sender);
    }

    // Additional functions to declare winners, distribute rewards, and manage competition state should be added here.
}
