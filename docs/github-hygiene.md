# GitHub Hygiene

Public repository means anyone can inspect it.

Never publish:
- Terraform state (`*.tfstate`, backups), plan files (`*.tfplan`), `.terraform/`
- populated `terraform.tfvars`, backend configuration, `.env`, tokens, client secrets, private keys
- tenant/customer/company details, subscription IDs if you want them private, portal screenshots with identifiers

Use GitHub secret scanning and review the staged changes before every push. If a credential is accidentally committed, revoke/rotate it immediately; deleting the commit alone is not sufficient.
