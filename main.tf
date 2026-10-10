resource "aws_cloudtrail" "this" {
  region                        = var.region
  name                          = var.name
  s3_bucket_name                = var.s3_bucket_name
  enable_logging                = var.enable_logging
  enable_log_file_validation    = var.enable_log_file_validation
  sns_topic_name                = var.sns_topic_name
  is_multi_region_trail         = var.is_multi_region_trail
  include_global_service_events = var.include_global_service_events
  cloud_watch_logs_role_arn     = var.cloud_watch_logs_role_arn
  cloud_watch_logs_group_arn    = var.cloud_watch_logs_group_arn
  kms_key_id                    = var.kms_key_id
  is_organization_trail         = var.is_organization_trail
  s3_key_prefix                 = var.s3_key_prefix
  tags                          = var.tags

  dynamic "insight_selector" {
    for_each = var.insight_selector

    content {
      insight_type = insight_selector.value
    }
  }

  dynamic "event_selector" {
    for_each = var.event_selector

    content {
      read_write_type                  = event_selector.value.read_write_type
      include_management_events        = event_selector.value.include_management_events
      exclude_management_event_sources = event_selector.value.exclude_management_event_sources

      dynamic "data_resource" {
        for_each = event_selector.value.data_resource

        content {
          type   = data_resource.value.type
          values = data_resource.value.values
        }
      }
    }
  }

  dynamic "advanced_event_selector" {
    for_each = var.advanced_event_selector

    content {
      name = advanced_event_selector.value.name

      dynamic "field_selector" {
        for_each = advanced_event_selector.value.field_selector

        content {
          field = field_selector.value.field

          ends_with       = field_selector.value.ends_with
          equals          = field_selector.value.equals
          not_ends_with   = field_selector.value.not_ends_with
          not_equals      = field_selector.value.not_equals
          not_starts_with = field_selector.value.not_starts_with
          starts_with     = field_selector.value.starts_with
        }
      }
    }
  }

  lifecycle {
    precondition {
      condition     = length(var.event_selector) == 0 || length(var.advanced_event_selector) == 0
      error_message = "event_selector and advanced_event_selector cannot be used together."
    }

    precondition {
      condition     = (var.cloud_watch_logs_group_arn == null) == (var.cloud_watch_logs_role_arn == null)
      error_message = "cloud_watch_logs_group_arn and cloud_watch_logs_role_arn must be specified together."
    }
  }
}
