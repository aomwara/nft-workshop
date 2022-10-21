compile: 
	npx hardhat compile

chain:	
	npx hardhat node

deploy:
	npx hardhat run scripts/deploy.ts --network live


