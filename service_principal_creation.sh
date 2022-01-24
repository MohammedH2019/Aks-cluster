#!/bin/bash
az ad sp create-for-rbac --name mo-eks-cluster-sp --role="Contributor"
