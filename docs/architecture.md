# Architecture (initial stage)

```text
                Terraform CLI / future Azure DevOps pipeline
                                |
                                v
                  Azure Blob remote Terraform state
                                |
                                v
                   Resource Group: network
                     /                     \
                    v                       v
              Hub VNet                 Workload VNet
            10.10.0.0/16               10.20.0.0/16
           /             \             /             \
  Shared Services     Management    AKS Nodes     Private Endpoints
    10.10.1.0/24      10.10.2.0/24 10.20.1.0/24   10.20.2.0/24
                    Bidirectional VNet peering

NSGs are attached to management and workload subnets. No workloads are deployed yet.
The hub currently contains no Azure Firewall, Bastion, or DNS VM/service. Those are future stages.
```

This stage establishes network segmentation and address planning, not a complete secure production hub-spoke implementation. NSGs start without custom allow rules; add reviewed rules as services are introduced.
