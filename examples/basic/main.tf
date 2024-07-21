module "basic_kms" {
  source                  = "./../../"
  description             = "Example basic kms key"
  deletion_window_in_days = 7
  tags                    = var.tags
}
