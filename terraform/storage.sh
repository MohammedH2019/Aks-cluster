#!/bin/bash

# create storage account for backend

echo "creating the storage account"

az storage account create  --name terraformstoarge2021   --resource-group tf-statefile  --location WestEurope --sku Standard_RAGRS  --kind StorageV2


 echo "creating the container in the storage account"

az storage container create  --name tfstatefile2021 --account-name terraformstoarge2021

