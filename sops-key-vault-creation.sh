#!/bin/bash

AZURE_CLIENT_ID=ed3828cd-90ad-441f-b2f4-8d1df8650ea1
az keyvault key create --name sops-key --vault-name mo-key-vault-dev --protection software --ops encrypt decrypt

az keyvault set-policy --name sops-key --resource-group eks_group --spn ed3828cd-90ad-441f-b2f4-8d1df8650ea1 \
  --key-permissions encrypt decrypt

az keyvault key show --name sops-key --vault-name mo-key-vault-dev --query key.kid
