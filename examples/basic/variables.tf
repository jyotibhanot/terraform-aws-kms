variable "tags" {
  type        = map(string)
  description = "Tags to apply to the kms resources"
  default = {
    Environment        = "dev"
    "user::CostCenter" = "terraform-modules"
    Department         = "DevOps"
    Project            = "Examples"
    Owner              = "test"
    repository         = "https://github.com/jyotibhanot/terraform-aws-kms.git"
  }
}
