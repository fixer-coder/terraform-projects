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

output "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name. Please refer to the S3 endpoints reference for format. Note: AWS CloudFront allows specifying an S3 region-specific endpoint when creating an S3 origin. This will prevent redirect issues from CloudFront to the S3 Origin URL. For more information, see the Virtual Hosted-Style Requests for Other Regions section in the AWS S3 User Guide."
  value       = aws_s3_bucket.public.bucket_regional_domain_name
}
