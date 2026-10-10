# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail_organization_delegated_admin_account

variable "account_id" {
  description = "(Required) An organization member account ID that you want to designate as a delegated administrator."
  type        = string
  nullable    = false

  validation {
    condition     = can(regex("^[0-9]{12}$", var.account_id))
    error_message = "account_id must be a 12-digit AWS account ID."
  }
}
