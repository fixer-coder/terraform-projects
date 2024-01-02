# ----------------------------------------------------------------------------------------------------------------------
# CREATE THE S3 BUCKET
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket" "public" {
  bucket        = var.name
  force_destroy = var.force_destroy
  tags          = var.tags
}

# ----------------------------------------------------------------------------------------------------------------------
# CONFIGURE BUCKET SERVER SIDE ENCRYPTION
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.public.id
  rule {
    bucket_key_enabled = var.bucket_key_enabled
    apply_server_side_encryption_by_default {
      # If a KMS key is not provided (kms_key_arn is null), the default aws/s3 key is used
      kms_master_key_id = var.kms_key_arn
      sse_algorithm     = var.sse_algorithm
    }
  }
}

# ----------------------------------------------------------------------------------------------------------------------
# CONFIGURE WHO OWNS OBJECTS IN THE S3 BUCKET
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket_ownership_controls" "bucket" {
  bucket = aws_s3_bucket.public.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
  # Without this depends_on, a "conflicting conditional operation" error may occur.
  depends_on = [aws_s3_bucket.public]
}

# ----------------------------------------------------------------------------------------------------------------------
# BUCKET VERSIONING
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.public.id
  versioning_configuration {
    status = var.enable_versioning
  }
}
