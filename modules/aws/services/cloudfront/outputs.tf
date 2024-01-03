output "cloudfront_domain_name" {
  description = "Domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net"
  value       = aws_cloudfront_distribution.cloudfront_s3.domain_name
}
