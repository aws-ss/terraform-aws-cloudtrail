# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail

variable "name" {
  description = "(Required) Name of the trail."
  type        = string
}

variable "s3_bucket_name" {
  description = "(Required) Name of the S3 bucket designated for publishing log files."
  type        = string
}

variable "enable_logging" {
  description = "(Optional) Enables logging for the trail. Defaults to true. Setting this to false will pause logging."
  type        = bool
  default     = null
}

variable "enable_log_file_validation" {
  description = "(Optional) Whether log file integrity validation is enabled. Defaults to false."
  type        = bool
  default     = true
}

variable "sns_topic_name" {
  description = "(Optional) Name of the Amazon SNS topic defined for notification of log file delivery."
  type        = string
  default     = null
}

variable "is_multi_region_trail" {
  description = "(Optional) Whether the trail is created in the current region or in all regions. Defaults to false."
  type        = bool
  default     = true
}

variable "include_global_service_events" {
  description = "(Optional) Whether the trail is publishing events from global services such as IAM to the log files. Defaults to true."
  type        = bool
  default     = null
}

variable "cloud_watch_logs_role_arn" {
  description = "(Optional) Role for the CloudWatch Logs endpoint to assume to write to a user’s log group."
  type        = string
  default     = null
}

variable "cloud_watch_logs_group_arn" {
  description = "(Optional) Log group name using an ARN that represents the log group to which CloudTrail logs will be delivered."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) Map of tags to assign to the trail. If configured with a provider"
  type        = map(string)
  default     = null
}

variable "kms_key_id" {
  description = "(Optional) KMS key ARN to use to encrypt the logs delivered by CloudTrail."
  type        = string
  default     = null
}

variable "is_organization_trail" {
  description = "(Optional) Whether the trail is an AWS Organizations trail. Organization trails log events for the master account and all member accounts. Can only be created in the organization master account."
  type        = bool
  default     = null
}

variable "s3_key_prefix" {
  description = "(Optional) S3 key prefix that follows the name of the bucket you have designated for log file delivery."
  type        = string
  default     = null
}

variable "insight_selector" {
  description = "(Optional) Configuration block for identifying unusual operational activity."
  type        = any
  default     = null
}

#variable "event_selector" {
#  description = "(Optional) Specifies an event selector for enabling data event logging."
#  type        = any
#  default     = null
#}

variable "advanced_event_selector" {
  description = "(Optional) Specifies an advanced event selector for enabling data event logging."
  type        = any
  default     = null
}
