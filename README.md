# Azure Function Terraform Project1

This Terraform project creates the necessary Azure resources to run a Python Azure Function.
Currently, the Python azure function code is in another repo, so you need to deploy your own function through CLI using `func publish` command.

## Resources Created

- Resource Group
- Storage Account
- Function App Service Plan (Consumption)
- Function App (Python 3.9)
- CosmosDB

## Prerequisites

- Terraform installed
- Azure CLI installed and logged in
- Azure subscription

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the planned changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

4. To destroy the resources:
```bash
terraform destroy
```

## Variables

