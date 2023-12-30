output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.public.arn
}

output "name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.public.id
}

output "website_endpoint" {
  description = "Website endpoint"
  value       = aws_s3_bucket_website_configuration.this.website_endpoint
}

output "website_domain" {
  description = "Domain of the website endpoint. This is used to create Route 53 alias records."
  value       = aws_s3_bucket_website_configuration.this.website_domain
}
