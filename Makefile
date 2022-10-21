compile: 
	npx hardhat compile

chain:	
	npx hardhat node

deploy-rinkeby:
	npx hardhat run scripts/deploy.ts --network rinkeby

deploy:
	npx hardhat run scripts/deploy.ts --network localhost

deploy-ropsten:
	npx hardhat run scripts/deploy.ts --network ropsten
