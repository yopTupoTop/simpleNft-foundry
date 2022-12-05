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
}