# https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedFieldSelector.html

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
  advanced_event_selector = [
    {
      name = "Advanced Event Selector 01"

      field_selector = [
        {
          field  = "resources.type"
          equals = ["AWS::GuardDuty::Detector"]
        },
        {
          field  = "eventCategory"
          equals = ["Data"]
        }
      ]
    },
    {
      name = "Advanced Event Selector 02"

      field_selector = [
        {
          field  = "resources.type"
          equals = ["AWS::S3::Object"]
        },
        {
          field  = "readOnly"
          equals = ["true"]
        },
        {
          field  = "eventCategory"
          equals = ["Data"]
        }
      ]
    },
  ]
  tags = {
    Team : "Security"
    Owner : "Security"
  }
}