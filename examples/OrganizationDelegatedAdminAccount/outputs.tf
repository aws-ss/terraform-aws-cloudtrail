output "arn" {
  description = "ARN of the delegated administrator's account."
  value       = module.cloudtrail_delegated_admin.arn
}

output "email" {
  description = "The email address that is associated with the delegated administrator's AWS account."
  value       = module.cloudtrail_delegated_admin.email
}

output "id" {
  description = "Account ID of the delegated administrator."
  value       = module.cloudtrail_delegated_admin.id
}

output "name" {
  description = "The friendly name of the delegated administrator's account."
  value       = module.cloudtrail_delegated_admin.name
}

output "service_principal" {
  description = "The AWS CloudTrail service principal name."
  value       = module.cloudtrail_delegated_admin.service_principal
}
