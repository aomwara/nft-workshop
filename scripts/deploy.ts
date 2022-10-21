import { ethers } from "hardhat";

async function main() {
  //set token uri here!
  const TOKEN_URI = "https://google.com/";

  const MyNFT = await ethers.getContractFactory("MyNFT");
  const mynft = await MyNFT.deploy(TOKEN_URI);
  await mynft.deployed();

  //log the address of the deployed contract
  console.log("MyNFT deployed to:", mynft.address);
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
