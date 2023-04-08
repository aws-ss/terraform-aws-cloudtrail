resource "aws_cloudtrail" "this" {
  name                          = var.name
  s3_bucket_name                = var.s3_bucket_name
  enable_logging                = var.enable_logging == null ? false : var.enable_logging
  enable_log_file_validation    = var.enable_log_file_validation == null ? false : var.enable_log_file_validation
  sns_topic_name                = var.sns_topic_name == null ? "" : var.sns_topic_name
  is_multi_region_trail         = var.is_multi_region_trail == null ? false : var.is_multi_region_trail
  include_global_service_events = var.include_global_service_events == null ? true : var.include_global_service_events
  cloud_watch_logs_role_arn     = var.cloud_watch_logs_role_arn == null ? "" : var.cloud_watch_logs_role_arn
  cloud_watch_logs_group_arn    = var.cloud_watch_logs_group_arn == null ? "" : var.cloud_watch_logs_group_arn
  kms_key_id                    = var.kms_key_id == null ? "" : var.kms_key_id
  is_organization_trail         = var.is_organization_trail == null ? false : var.is_organization_trail
  s3_key_prefix                 = var.s3_key_prefix == null ? "" : var.s3_key_prefix
  tags                          = var.tags

  dynamic "insight_selector" {
    for_each = var.insight_selector == null ? {} : var.insight_selector
    iterator = insight_selector

    content {
      insight_type = insight_selector.key
    }
  }

  dynamic "event_selector" {
    for_each = var.event_selector == null ? [] : [1]

    content {
      read_write_type                  = var.event_selector.read_write_type == null ? "All" : var.event_selector.read_write_type
      include_management_events        = var.event_selector.include_management_events == null ? true : var.event_selector.include_management_events
      exclude_management_event_sources = var.event_selector.exclude_management_event_sources == null ? [] : var.event_selector.exclude_management_event_sources

      dynamic "data_resource" {
        for_each = lookup(var.event_selector, "data_resource", null) == null ? [] : [lookup(var.event_selector, "data_resource")]
        content {
          type   = lookup(data_resource.value, "type")
          values = lookup(data_resource.value, "values")
        }
      }
    }
  }
}
