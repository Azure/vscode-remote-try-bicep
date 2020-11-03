build:
	bicep build main.bicep

deploy: build
	az group create -n my-rg -l eastus
	az deployment group create -f ./main.json -g my-rg

