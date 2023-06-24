# https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedFieldSelector.html

provider "aws" {
  region = "ap-northeast-2"
}

module "cloudtrail" {
  source = "../..//"

  name           = "CloudTrail01"
  s3_bucket_name = "aws-cloudtrail-logs-362252864672-5f4dec40"
  enable_logging = true
  insight_selector = {
    ApiCallRateInsight : true
    ApiErrorRateInsight : true
  }
  advanced_event_selector = [
    {
      name = "Advanced Event Selector"
      field_selector = [
        {
          field  = "eventCategory"
          equals = ["Management"]
        },
        {
          field      = "eventSource"
          not_equals = ["kms.amazonaws.com", "rdsdata.amazonaws.com"]
        }
      ]
    },
    {
      name = "Advanced Event Selector"
      field_selector = [
        {
          field  = "eventCategory"
          equals = ["Data"]
        },
        {
          field  = "resources.type"
          equals = ["AWS::S3::Object"]
        }
      ]
    },
  ]
  tags = {
    Team : "Security"
    Owner : "Security"
  }
}