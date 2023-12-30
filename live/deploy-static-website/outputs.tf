output "website_domain" {
  description = "Domain of the website endpoint. This is used to create Route 53 alias records."
  value       = module.static_website.website_domain
}

output "public_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.static_website.name
}

output "website_endpoint" {
  description = "Website endpoint."
  value       = module.static_website.website_endpoint
}

output "public_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.static_website.bucket_arn
}
