# organization-delegated-admin-account

A Terraform submodule that designates an organization member account as an AWS CloudTrail delegated administrator.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.0.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_cloudtrail_organization_delegated_admin_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail_organization_delegated_admin_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | (Required) An organization member account ID that you want to designate as a delegated administrator. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the delegated administrator's account. |
| <a name="output_email"></a> [email](#output\_email) | The email address that is associated with the delegated administrator's AWS account. |
| <a name="output_id"></a> [id](#output\_id) | Account ID of the delegated administrator. |
| <a name="output_name"></a> [name](#output\_name) | The friendly name of the delegated administrator's account. |
| <a name="output_service_principal"></a> [service\_principal](#output\_service\_principal) | The AWS CloudTrail service principal name. |
<!-- END_TF_DOCS -->
