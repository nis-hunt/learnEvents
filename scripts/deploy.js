
const hre = require("hardhat");

async function main() {
  await hre.run('compile');

  // @dev lets deploy the contract nooowww, lets: getfactory, deploy, check deployed...
  const SimpleStorage = await hre.ethers.getContractFactory("SimpleStorage");
  const simpleStorage = await SimpleStorage.deploy();
  await simpleStorage.deployed();
  console.log(simpleStorage.address);
  //@dev now lets try to listen to the events, lets: call the function
  // inside of simpleStorage, wait and log...
  const transactionResponse = await simpleStorage.store(2);
  const transactionReceipt = await transactionResponse.wait();
  // console.log(transactionReceipt);
  console.log(transactionReceipt.events[0].args.oldNumber.toString());
  console.log(transactionReceipt.events[0].args.newNumber.toString());
  console.log(transactionReceipt.events[0].args.addedNumber.toString());
  console.log(transactionReceipt.events[0].args.sender);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
