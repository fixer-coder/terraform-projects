output "website_endpoint" {
  description = "Website endpoint."
  value       = module.static_website_s3_bucket.website_endpoint
}
