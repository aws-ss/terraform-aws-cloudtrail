provider "aws" {
  region = "ap-northeast-2"
}

module "cloudtrail" {
  source = "../..//"

  name                  = "OrganizationTrail"
  is_organization_trail = true
  enable_logging        = true
  s3_bucket_name        = "cloudtrail-logs-123456789012"
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