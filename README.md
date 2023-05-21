# terraform-aws-cloudtrail

A Terraform module that creates AWS CloudTrail.

## Available Features

- Advanced Event Selector
- Event Selector

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudtrail.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_advanced_event_selector"></a> [advanced\_event\_selector](#input\_advanced\_event\_selector) | (Optional) Specifies an advanced event selector for enabling data event logging. | `any` | `null` | no |
| <a name="input_cloud_watch_logs_group_arn"></a> [cloud\_watch\_logs\_group\_arn](#input\_cloud\_watch\_logs\_group\_arn) | (Optional) Log group name using an ARN that represents the log group to which CloudTrail logs will be delivered. | `string` | `null` | no |
| <a name="input_cloud_watch_logs_role_arn"></a> [cloud\_watch\_logs\_role\_arn](#input\_cloud\_watch\_logs\_role\_arn) | (Optional) Role for the CloudWatch Logs endpoint to assume to write to a user’s log group. | `string` | `null` | no |
| <a name="input_enable_log_file_validation"></a> [enable\_log\_file\_validation](#input\_enable\_log\_file\_validation) | (Optional) Whether log file integrity validation is enabled. Defaults to false. | `bool` | `null` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | (Optional) Enables logging for the trail. Defaults to true. Setting this to false will pause logging. | `bool` | `null` | no |
| <a name="input_include_global_service_events"></a> [include\_global\_service\_events](#input\_include\_global\_service\_events) | (Optional) Whether the trail is publishing events from global services such as IAM to the log files. Defaults to true. | `bool` | `null` | no |
| <a name="input_insight_selector"></a> [insight\_selector](#input\_insight\_selector) | (Optional) Configuration block for identifying unusual operational activity. | `any` | `null` | no |
| <a name="input_is_multi_region_trail"></a> [is\_multi\_region\_trail](#input\_is\_multi\_region\_trail) | (Optional) Whether the trail is created in the current region or in all regions. Defaults to false. | `bool` | `null` | no |
| <a name="input_is_organization_trail"></a> [is\_organization\_trail](#input\_is\_organization\_trail) | (Optional) Whether the trail is an AWS Organizations trail. Organization trails log events for the master account and all member accounts. Can only be created in the organization master account. | `bool` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | (Optional) KMS key ARN to use to encrypt the logs delivered by CloudTrail. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the trail. | `string` | n/a | yes |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | (Required) Name of the S3 bucket designated for publishing log files. | `string` | n/a | yes |
| <a name="input_s3_key_prefix"></a> [s3\_key\_prefix](#input\_s3\_key\_prefix) | (Optional) S3 key prefix that follows the name of the bucket you have designated for log file delivery. | `string` | `null` | no |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | (Optional) Name of the Amazon SNS topic defined for notification of log file delivery. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Map of tags to assign to the trail. If configured with a provider | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_cloudtrail_arn"></a> [aws\_cloudtrail\_arn](#output\_aws\_cloudtrail\_arn) | ARN of the trail. |
| <a name="output_aws_cloudtrail_home_region"></a> [aws\_cloudtrail\_home\_region](#output\_aws\_cloudtrail\_home\_region) | Region in which the trail was created. |
| <a name="output_aws_cloudtrail_id"></a> [aws\_cloudtrail\_id](#output\_aws\_cloudtrail\_id) | Name of the trail. |
| <a name="output_aws_cloudtrail_tags_all"></a> [aws\_cloudtrail\_tags\_all](#output\_aws\_cloudtrail\_tags\_all) | Map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END_TF_DOCS -->