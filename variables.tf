# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail

variable "region" {
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null
}

variable "name" {
  description = "(Required) Name of the trail."
  type        = string
  nullable    = false
}

variable "s3_bucket_name" {
  description = "(Required) Name of the S3 bucket designated for publishing log files."
  type        = string
  nullable    = false
}

variable "enable_logging" {
  description = "(Optional) Enables logging for the trail. Defaults to true. Setting this to false will pause logging."
  type        = bool
  default     = true
  nullable    = false
}

variable "enable_log_file_validation" {
  description = "(Optional) Whether log file integrity validation is enabled. Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}

variable "sns_topic_name" {
  description = "(Optional) Name of the Amazon SNS topic defined for notification of log file delivery."
  type        = string
  default     = null
}

variable "is_multi_region_trail" {
  description = "(Optional) Whether the trail is created in the current region or in all regions. Defaults to false."
  type        = bool
  default     = false
  nullable    = false
}

variable "include_global_service_events" {
  description = "(Optional) Whether the trail is publishing events from global services such as IAM to the log files. Defaults to true."
  type        = bool
  default     = true
  nullable    = false
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
  description = "(Optional) Map of tags to assign to the trail. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
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
  default     = false
  nullable    = false
}

variable "s3_key_prefix" {
  description = "(Optional) S3 key prefix that follows the name of the bucket you have designated for log file delivery."
  type        = string
  default     = null
}

variable "insight_selector" {
  description = "(Optional) List of insight types to log on the trail. Valid values are: ApiCallRateInsight and ApiErrorRateInsight."
  type        = list(string)
  default     = []
  nullable    = false

  validation {
    condition     = alltrue([for t in var.insight_selector : contains(["ApiCallRateInsight", "ApiErrorRateInsight"], t)])
    error_message = "insight_selector values must be one of: ApiCallRateInsight, ApiErrorRateInsight."
  }
}

variable "event_selector" {
  description = "(Optional) Specifies an event selector for enabling data event logging. Conflicts with advanced_event_selector."
  type = list(object({
    read_write_type                  = optional(string)
    include_management_events        = optional(bool)
    exclude_management_event_sources = optional(list(string))
    data_resource = optional(list(object({
      type   = string
      values = list(string)
    })), [])
  }))
  default  = []
  nullable = false

  validation {
    condition     = alltrue([for s in var.event_selector : contains(["ReadOnly", "WriteOnly", "All"], coalesce(s.read_write_type, "All"))])
    error_message = "event_selector read_write_type must be one of: ReadOnly, WriteOnly, All."
  }
}

variable "advanced_event_selector" {
  description = "(Optional) Specifies an advanced event selector for enabling data event logging. Conflicts with event_selector."
  type = list(object({
    name = optional(string)
    field_selector = list(object({
      field           = string
      ends_with       = optional(list(string))
      equals          = optional(list(string))
      not_ends_with   = optional(list(string))
      not_equals      = optional(list(string))
      not_starts_with = optional(list(string))
      starts_with     = optional(list(string))
    }))
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue(flatten([
      for s in var.advanced_event_selector : [
        for f in s.field_selector : anytrue([
          f.ends_with != null,
          f.equals != null,
          f.not_ends_with != null,
          f.not_equals != null,
          f.not_starts_with != null,
          f.starts_with != null,
        ])
      ]
    ]))
    error_message = "advanced_event_selector field_selector must specify at least one of: ends_with, equals, not_ends_with, not_equals, not_starts_with, starts_with."
  }
}
