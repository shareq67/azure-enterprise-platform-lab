# Azure Enterprise Cloud Platform Lab

A cost-conscious, self-built Azure infrastructure lab using Terraform. This is a learning lab, **not a production deployment**.

## Initial scope (Stage 0 + Stage 1)

- **Stage 0 – State bootstrap:** Azure Storage Account + private-by-default blob container settings + Entra ID RBAC for Terraform state access.
- **Stage 1 – Networking foundation:** Resource group, hub VNet, workload VNet, subnets, NSGs, and VNet peering.
- No AKS, VM, NAT Gateway, Azure Firewall, Bastion, Application Gateway, Log Analytics, public IP, or paid compute is created in these stages.

> Azure resources can incur charges even when idle. Review the Azure Cost Management view and the pricing calculator before adding later stages. A budget/alert is not a hard spending cap.

## Prerequisites

1. Azure CLI installed and logged in: `az login`
2. Terraform installed (use a current stable release compatible with the constraints in `versions.tf`).
3. Permissions in the target subscription to create resources and role assignments. State bootstrap requires permission to create a role assignment (typically Owner or User Access Administrator plus appropriate resource permissions).
4. Confirm the subscription is the intended **Visual Studio/MSDN dev/test subscription** and verify the credit/spending limit in Cost Management.
5. Choose a globally unique Storage Account name: 3–24 lowercase letters/numbers only.

## Folder map

- `infra/bootstrap`: creates the remote-state Storage Account and container. Run this first with local state.
- `infra/environments/lab`: creates the initial network foundation using remote state.
- `infra/modules/networking`: reusable networking module.
- `docs`: deployment, cost, GitHub hygiene and troubleshooting notes.

## Important state workflow

The bootstrap folder initially uses **local state** so it can create the backend itself. After it succeeds, copy the output values into `infra/environments/lab/backend.hcl` and configure the lab backend. Do not commit `terraform.tfstate`, `.tfstate.backup`, plan files, secrets, or real `*.tfvars`.

Keep the bootstrap state backed up privately until the remote backend migration is verified. The bootstrap state contains resource metadata, so treat it as operationally sensitive.

## Deploy order

See `docs/deployment-guide.md`. Do not run `apply` without reviewing the plan. Use the same signed-in identity for the initial CLI workflow.

## Public GitHub checklist

- Commit only `.tf`, `.md`, `.gitignore`, and the example variable file.
- Never commit credentials, subscription IDs if you prefer to keep them private, state files, saved plans, private keys, or populated tfvars.
- Do not include real tenant/customer/company information.
- Add screenshots only after removing subscription IDs, email addresses, resource IDs, and any sensitive portal details.

## Next stages (not created yet)

1. Add cost monitoring and alerts.
2. Add Key Vault and ACR (check region/offer availability and pricing first).
3. Add a small AKS experiment only after confirming current credit and daily cost.
4. Add ingress/WAF, database/private endpoints, and centralized firewall only as short, deliberate experiments.
