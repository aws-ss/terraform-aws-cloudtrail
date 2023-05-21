provider "aws" {
  region = "ap-northeast-2"
}

module "cloudtrail" {
  source = "../..//"

  name           = "CloudTrail01"
  s3_bucket_name = "cloudtrail-logs-123456789012"
  enable_logging = true
  insight_selector = {
    ApiCallRateInsight : true
    ApiErrorRateInsight : true
  }
  event_selector = {
    read_write_type : "All"
    include_management_events : true
    exclude_management_event_sources : ["kms.amazonaws.com"]
    data_resource : {
      type : "AWS::S3::Object"
      values : ["arn:aws:s3"]
    }
  }
  tags = {
    Team : "Security"
    Owner : "Security"
  }
}