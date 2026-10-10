# https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedFieldSelector.html

provider "aws" {
  region = "ap-northeast-2"
}

module "cloudtrail" {
  source = "../..//"

  name             = "amzn-demo-trails"
  s3_bucket_name   = "amzn-s3-demo-bucket"
  enable_logging   = true
  insight_selector = ["ApiCallRateInsight", "ApiErrorRateInsight"]
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
    }
  ]
}