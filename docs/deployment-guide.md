# Deployment Guide

## 0. Confirm account and subscription

```bash
az login
az account list --output table
az account set --subscription "<YOUR-SUBSCRIPTION-ID>"
az account show --output table
```

Confirm the Visual Studio/MSDN subscription, region availability, credit balance, and spending limit. Do not assume the ₹12,000 estimate is automatically covered; Visual Studio credits have eligibility and service restrictions.

## 1. Bootstrap remote state (initial local state)

```bash
cd infra/bootstrap
az login
terraform init
terraform fmt -recursive
terraform validate
```

Set the subscription ID without committing it.

PowerShell:
```powershell
$env:ARM_SUBSCRIPTION_ID = "<YOUR-SUBSCRIPTION-ID>"
terraform plan -var="subscription_id=$env:ARM_SUBSCRIPTION_ID" -var="state_storage_account_name=<UNIQUE-LOWERCASE-NAME>"
terraform apply -var="subscription_id=$env:ARM_SUBSCRIPTION_ID" -var="state_storage_account_name=<UNIQUE-LOWERCASE-NAME>"
```

Bash:
```bash
export ARM_SUBSCRIPTION_ID="<YOUR-SUBSCRIPTION-ID>"
terraform plan -var="subscription_id=$ARM_SUBSCRIPTION_ID" -var="state_storage_account_name=<unique-lowercase-name>"
terraform apply -var="subscription_id=$ARM_SUBSCRIPTION_ID" -var="state_storage_account_name=<unique-lowercase-name>"
```

Read the outputs and create a local `infra/environments/lab/backend.hcl` file using the displayed values. This file is ignored by Git.

Example:
```hcl
resource_group_name  = "rg-aep-lab-tfstate"
storage_account_name = "replace-with-your-account-name"
container_name       = "tfstate"
key                  = "lab-network.tfstate"
use_azuread_auth     = true
```

The identity running Terraform needs `Storage Blob Data Contributor` on the state storage account. RBAC propagation can take a few minutes. Ensure Azure CLI login uses the same identity.

## 2. Initialize and deploy network foundation

```bash
cd ../environments/lab
```

Copy `terraform.tfvars.example` to `terraform.tfvars`, fill the subscription ID locally, and do not commit it.

```bash
terraform init -backend-config=backend.hcl
terraform fmt -recursive
terraform validate
terraform plan -out=network.tfplan
terraform show network.tfplan
terraform apply network.tfplan
terraform output
```

Review the plan carefully. It should only create the resource group, VNets, subnets, NSGs, subnet associations and VNet peerings. No compute, public IP, NAT, firewall, Bastion, AKS or gateway should be created in this stage.

## 3. Verify

```bash
az network vnet list --resource-group rg-aep-lab-network --output table
az network vnet peering list --resource-group rg-aep-lab-network --vnet-name vnet-aep-lab-hub --output table
terraform state list
```

Resource names use `project_name`; if changed, update the verification command accordingly.

## 4. GitHub

```bash
git init
git add README.md .gitignore docs infra
git status
git commit -m "Add staged Terraform bootstrap and hub-spoke network foundation"
git branch -M main
git remote add origin https://github.com/<YOUR-USERNAME>/azure-enterprise-platform-lab.git
git push -u origin main
```

Before committing, check `git status` and confirm no `.tfstate`, `backend.hcl`, populated `terraform.tfvars`, plans, credentials, or account identifiers are staged.

## 5. Cleanup

To remove only the networking foundation:

```bash
cd infra/environments/lab
terraform plan -destroy -out=destroy-network.tfplan
terraform show destroy-network.tfplan
terraform apply destroy-network.tfplan
```

This removes the network resources managed by that state. It does not remove the remote-state Storage Account, which is intentionally separate.

If you want to delete the state account too, first ensure all Terraform environments using it have been destroyed, keep a secure private copy of any state you need, then destroy `infra/bootstrap` using its local state:

```bash
cd ../../bootstrap
terraform plan -destroy
terraform destroy
```

**Never delete the state Storage Account while any active Terraform state depends on it.** Confirm no other state files are stored in its container. Also check the Azure Portal for leftover resources and ongoing charges after cleanup.
