module "kms_complete" {
  source                  = "./../../"
  description             = "Example complete kms key with IAM user permisions"
  alias_name              = "alias/${var.name}"
  create_kms_alias        = true
  kms_policy              = local.policy
  deletion_window_in_days = var.deletion_window_in_days
  tags                    = var.tags
}
