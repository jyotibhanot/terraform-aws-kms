# terraform-aws-kms
Terraform AWS KMS module

This module created a KMS key and a KMS key Alias

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=5.50.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias_name"></a> [alias\_name](#input\_alias\_name) | The display name of the alias. The name must start with the word `alias` followed by a forward slash (alias/) | `string` | `null` | no |
| <a name="input_bypass_policy_lockout_safety_check"></a> [bypass\_policy\_lockout\_safety\_check](#input\_bypass\_policy\_lockout\_safety\_check) | A flag to indicate whether to bypass the key policy lockout safety check. Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.The default value is false. | `bool` | `false` | no |
| <a name="input_create_kms_alias"></a> [create\_kms\_alias](#input\_create\_kms\_alias) | Whether to create KMS alias or not | `bool` | `false` | no |
| <a name="input_customer_master_key_spec"></a> [customer\_master\_key\_spec](#input\_customer\_master\_key\_spec) | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC\_DEFAULT, RSA\_2048, RSA\_3072, RSA\_4096, ECC\_NIST\_P256, ECC\_NIST\_P384, ECC\_NIST\_P521, or ECC\_SECG\_P256K1. Defaults to SYMMETRIC\_DEFAULT. | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30. If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately. | `number` | `30` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the key as viewed in AWS console. | `string` | `null` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled. Defaults to false. | `bool` | `true` | no |
| <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled) | Specifies whether the key is enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage) | Specifies the intended use of the key. Valid values: ENCRYPT\_DECRYPT or SIGN\_VERIFY. Defaults to ENCRYPT\_DECRYPT | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_kms_policy"></a> [kms\_policy](#input\_kms\_policy) | A valid policy JSON document. Although this is a key policy, not an IAM policy, an aws\_iam\_policy\_document, in the form that designates a principal, can be used | `string` | `null` | no |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | Indicates whether the KMS key is a multi-Region (true) or regional (false) key. Defaults to false. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the object. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the key. |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | The globally unique identifier for the key. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags |
| <a name="output_target_key_id"></a> [target\_key\_id](#output\_target\_key\_id) | Identifier for the key for which the alias is for, can be either an ARN or key\_id. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
