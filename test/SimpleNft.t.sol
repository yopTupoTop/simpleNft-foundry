pragma solidity ^0.8.17;

import "lib/forge-std/src/Test.sol";
import "src/SimpleNft.sol";

contract SimpleNftTest is Test {
    using stdStorage for StdStorage;

    SimpleNft private nft;

    function setUp() public {
        nft = new SimpleNft("baseUri");
    }

    function testFaildNoMintPricePaid() public {
        nft.mint(address(1));
    }

    function testMintPricePaid() public {
        nft.mint{value: 0.08 ether}(address(1));
    }

    function testFaildMaxSuppply() public {
        uint256 slot = stdstore
        .target(address(nft))
        .sig("currentTokenId()")
        .find();

        bytes32 loc = bytes32(slot);
        bytes32 mockedCurrentTokenId = bytes32(abi.encode(10000));
        vm.store(address(nft), loc, mockedCurrentTokenId);
        nft.mint{value: 0.08 ether}(address(1));
    }

    function testMintAndAdd() public {
        nft.mint{value: 0.08 ether}(address(1));
        vm.deal(address(1), 2e18);
        console.log(nft.balanceOf(address(1)));
    }


}