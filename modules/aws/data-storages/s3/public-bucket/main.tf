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
# BLOCK ALL POSSIBILITY OF ACCIDENTALLY ENABLING PUBLIC ACCESS TO THIS BUCKET OUTSIDE OF INITIAL POLICY
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.public.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  depends_on              = [aws_s3_bucket.public]
}
# ----------------------------------------------------------------------------------------------------------------------
# CREATE A BUCKET POLICY TO CONTROL ACCESS TO THE BUCKET
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket_policy" "grant_public_access_to_objects" {
  bucket     = aws_s3_bucket.public.id
  policy     = data.aws_iam_policy_document.grant_public_access_to_objects.json
  depends_on = [aws_s3_bucket_public_access_block.public_access]
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
# ----------------------------------------------------------------------------------------------------------------------
# CREATE A BUCKET POLICY TO CONTROL ACCESS TO THE BUCKET
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.public.id
  index_document {
    suffix = var.index_document
  }
  error_document {
    key = var.error_document_key
  }
  # Without this depends_on, a "conflicting conditional operation" error may occur.
  depends_on = [aws_s3_bucket.public]
}

data "aws_iam_policy_document" "grant_public_access_to_objects" {
  statement {
    sid = "GrantPublicAccessToObjects"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.name}/*"]
  }
}
