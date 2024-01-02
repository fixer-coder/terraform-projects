output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.public.arn
}

output "name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.public.id
}
