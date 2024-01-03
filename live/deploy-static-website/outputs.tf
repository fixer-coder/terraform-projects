output "website_endpoint" {
  description = "Website endpoint."
  value       = module.static_website_s3_bucket.website_endpoint
}

output "cloudfront_domain_name" {
  description = "Domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net"
  value       = module.cloudfront_distribution.cloudfront_domain_name
}

output "Information" {
  value = "Remember to manually authenticate the connection to github and trigger pipeline again"
}
