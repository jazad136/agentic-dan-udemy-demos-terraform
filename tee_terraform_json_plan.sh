terraform show -json terraform-plan.tfplan |jq . |tee terraform-plan.json | head -n20
