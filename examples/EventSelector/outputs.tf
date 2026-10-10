output "arn" {
  description = "ARN of the trail."
  value       = module.cloudtrail.arn
}

output "home_region" {
  description = "Region in which the trail was created."
  value       = module.cloudtrail.home_region
}

output "id" {
  description = "ARN of the trail."
  value       = module.cloudtrail.id
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cloudtrail.tags_all
}
