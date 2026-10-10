provider "aws" {
  region = "ap-northeast-2"
}

module "cloudtrail" {
  source = "../..//"

  name             = "amzn-demo-trails"
  s3_bucket_name   = "amzn-s3-demo-bucket"
  enable_logging   = true
  insight_selector = ["ApiCallRateInsight", "ApiErrorRateInsight"]
  event_selector = [
    {
      read_write_type                  = "All"
      include_management_events        = true
      exclude_management_event_sources = ["kms.amazonaws.com"]
      data_resource = [
        {
          type   = "AWS::S3::Object"
          values = ["arn:aws:s3"]
        }
      ]
    },
    {
      read_write_type           = "WriteOnly"
      include_management_events = false
      data_resource = [
        {
          type   = "AWS::Lambda::Function"
          values = ["arn:aws:lambda"]
        }
      ]
    },
    {
      read_write_type           = "ReadOnly"
      include_management_events = false
      data_resource = [
        {
          type   = "AWS::DynamoDB::Table"
          values = ["arn:aws:dynamodb"]
        }
      ]
    }
  ]
}