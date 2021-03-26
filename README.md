# NSGac

az deployment group create -n deploy$(Get-Random) -g testNSG --template-file .\azuredeploy.json --parameters location=westeurope NSGs=@rules.json