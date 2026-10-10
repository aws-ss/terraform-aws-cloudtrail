provider "aws" {
  region = "ap-northeast-2"
}

module "cloudtrail_delegated_admin" {
  source = "../..//modules/organization-delegated-admin-account"

  account_id = "123456789012"
}
