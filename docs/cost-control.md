# Cost Control

Budget ceiling: ₹12,000. This is a maximum, not a spending target.

## Stage 0 and 1
The initial bootstrap creates a Storage Account and the network stage creates networking resources only. No VM, AKS, firewall, Bastion, Application Gateway, public IP, NAT Gateway, or Log Analytics workspace is created in these stages. Storage transactions/capacity and any region-specific charges may still apply.

## Rules
1. Create Azure Cost Management budget and email alerts before adding billable services. Alerts notify; they do not stop spending.
2. Check actual credit balance and spending-limit status directly in the subscription.
3. Keep expensive services (AKS node VMs, Azure Firewall, Application Gateway/WAF, Bastion Standard, NAT Gateway) out of the always-on baseline.
4. Add one service at a time, run a short experiment, capture evidence, then destroy it.
5. After `terraform destroy`, check for residual resources and charges.
6. Re-check prices and service availability for Central India before every new stage.
7. Visual Studio subscription credits are for individual development/test use and may exclude some products/services. Verify eligibility for each service.

## Suggested staged order
- Stage 0: state storage.
- Stage 1: VNet, subnets, NSGs, peering.
- Stage 2: Azure Monitor alerting / cost views (confirm any chargeable workspace ingestion).
- Stage 3: Key Vault and ACR (verify service-specific pricing/benefit eligibility).
- Stage 4: short AKS deployment experiment, only after cost review.
- Stage 5: Application Gateway/WAF and Firewall as short optional experiments; destroy promptly.
