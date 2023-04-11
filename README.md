<!--
TOKEN                  = > 0x32dAC59D250f097B1654617Aa9bf0F8a7bd28935
NFT                    = > 0xB9Be123113d8449D30703Dd1C09b6734aB1BF280
VOTING                 = > 0xCC7945492A22DC3050837a0E8497D7b48b4fbD63
RemixCompetition       = > 0x32ef5b0D184F6086d9a88a92b4244d64c91Fe49B
MARKETPLACE            = > 0x09CC6327074BaddC76aE6239033b57DEd67e31E0
GOVERNANCE             = > 0x2365F50067E612dCb1dc2BFb9b9172DacfA7999D 
-->

# RemixChain - A Decentralized Platform for Remix Competitions and Collaborative Music Production
RemixChain is a decentralized platform designed to host remix competitions for emerging DJs and electronic music producers. The platform aims to foster collaboration, creativity, and rewards participants with tokenized incentives and NFTs. Built on Ethereum and leveraging IPFS for metadata storage, RemixChain provides a seamless and user-friendly experience for artists, labels, DJs, and producers.

## About the Project
The objective of RemixChain is to develop a blockchain-based platform that hosts remix competitions, facilitates collaboration, and rewards users with tokenized incentives and NFTs. The platform focuses on supporting emerging DJs and electronic music producers by offering various features, including:

### Remix Competition Hub:
A platform where artists and labels can post remix competitions, providing stems, track information, and submission guidelines. DJs and producers can browse, participate in competitions, and submit their remixes for consideration.

### Smart Contract-based Voting and Rewards(feature coming soon! contracts already deployed , only frontend pending!): 
Implementation of smart contracts that facilitate secure and transparent voting for the best remixes. Winners can receive tokenized rewards, NFT collectibles, or other prizes, such as music production software or hardware.

### Tokenized Incentives for Participation and Engagement: 
A token economy that rewards users for participating in remix competitions, providing feedback on other users' remixes, and sharing content on social media. Tokens can be redeemed for access to premium features, discounts on music production tools, or entry to exclusive events.

### NFT-based Remix Releases and Collectibles:
Winning remixes can be released as NFTs, providing DJs and producers with a new revenue stream and a unique way to showcase their work. Artists can also create NFT-based digital collectibles, such as artwork or animated visuals that accompany their remixes.

### Collaboration and Networking:
A platform feature that enables DJs, producers, and artists to connect, collaborate, and exchange ideas. This system should support messaging, file sharing, and the ability to create project-specific chat rooms or channels.

### Decentralized Marketplace for Music Production Services:
A decentralized marketplace that connects DJs and producers with industry professionals, such as mixing and mastering engineers, graphic designers, or music promoters. Users can offer their services, collaborate on projects, and negotiate deals using smart contracts.

### Decentralized Governance and Community Involvement(again this feauture is yet to come, contracts deployed):
A decentralized governance system that allows users to participate in platform-related decisions, such as proposing new features, voting on competition themes, or selecting featured artists. This system should foster community engagement and ensure that the platform remains user-centric.

## Features
+ Host NFT-based contests: Creators can easily host contests by listing their NFTs and setting contest rules.
+ Participate in contests: Users can browse through active contests and participate in the ones they're interested in.
+ Decentralized storage: All metadata is stored on IPFS via Pinata, ensuring secure and decentralized storage for NFT information.
+ User-friendly interface: RemixChain offers a clean and intuitive interface, making it easy for users to navigate and interact with the platform.

## Installation

Follow these steps to set up the project on your local machine:

### Prerequisites

- Node.js (version 14 or higher)
- npm (version 7 or higher)
- MetaMask browser extension

### Clone the repository

```bash
git clone https://github.com/gaurav-11018/RemixChain.git
cd RemixChain
```

## Configure environment variables
Create a .env file in the project root directory and add the following variables:
```bash
REACT_APP_INFURA_API_KEY=your_infura_api_key
REACT_APP_PINATA_API_KEY=your_pinata_api_key
REACT_APP_PINATA_API_SECRET=your_pinata_api_secret
```

## Start the development server
```bash
npm start
```
The project will now be running on http://localhost:3000/. Open your browser and visit the URL to see the application.


## Contracts

The project consists of 6 smart contracts, all deployed on the Polygon Mumbai Testnet. The addresses and explanations for these contracts are as follows:

- **Token (Token.sol)**: `0x32dAC59D250f097B1654617Aa9bf0F8a7bd28935` - This contract manages the platform's native token, which is used to incentivize participation and engagement. It's an ERC20-compliant token with standard functionalities like transfer, approve, and allowance.

- **NFT (NFT.sol)**: `0xB9Be123113d8449D30703Dd1C09b6734aB1BF280` - This contract is responsible for creating and managing NFTs representing remixes and other digital collectibles. It's an ERC721-compliant contract that allows for the minting, transferring, and querying of NFTs.

- **Voting (Voting.sol)**: `0xCC7945492A22DC3050837a0E8497D7b48b4fbD63` - This contract handles the voting process for remix competitions. It uses smart contracts to ensure secure and transparent voting, as well as the distribution of tokenized rewards to winners.

- **RemixCompetition (RemixCompetition.sol)**: `0x32ef5b0D184F6086d9a88a92b4244d64c91Fe49B` - This contract manages the remix competitions, allowing artists and labels to post competitions, provide stems, track information, and submission guidelines. It also enables DJs and producers to participate in competitions and submit their remixes.

- **Marketplace (Marketplace.sol)**: `0x09CC6327074BaddC76aE6239033b57DEd67e31E0` - This contract powers a decentralized marketplace where users can offer and purchase music production services. It connects DJs, producers, and industry professionals, facilitating collaboration and negotiation through smart contracts.

- **Governance (Governance.sol)**: `0x2365F50067E612dCb1dc2BFb9b9172DacfA7999D` - This contract implements a decentralized governance system that allows users to participate in platform-related decisions. It fosters community engagement and ensures the platform remains user-centric.

These contracts are responsible for managing the various aspects of the platform, such as token transactions, NFT creation, voting, remix competitions, marketplace, and governance.
