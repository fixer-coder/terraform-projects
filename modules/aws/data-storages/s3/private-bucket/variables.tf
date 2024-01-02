# ------------------- -------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "What to name the S3 bucket. Note that S3 bucket names must be globally unique across all AWS users!"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# Generally, these values won't need to be changed.
# ---------------------------------------------------------------------------------------------------------------------

variable "force_destroy" {
  description = "If set to true, when you run 'terraform destroy', delete all objects from the bucket so that the bucket can be destroyed without error. Warning: these objects are not recoverable so only use this if you're absolutely sure you want to permanently delete everything!"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "Optional KMS key to use for encrypting data in the S3 bucket. If null, data in S3 will be encrypted using the default aws/s3 key. If provided, the key policy of the provided key must allow whoever is writing to this bucket to use that key."
  type        = string
  default     = null
}

variable "bucket_key_enabled" {
  # See https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html
  description = "Optional whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
  type        = bool
  default     = false
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms."
  type        = string
  default     = "AES256"
}

variable "tags" {
  description = "A map of tags to apply to the S3 Bucket. The key is the tag name and the value is the tag value."
  type        = map(string)
  default     = {}
}

variable "enable_versioning" {
  description = "Versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled. Disabled should only be used when creating or importing resources that correspond to S3 buckets that is not versioned."
  type        = string
  default     = "Enabled"
}
