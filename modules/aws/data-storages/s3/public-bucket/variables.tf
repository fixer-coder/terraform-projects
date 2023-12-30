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
  default     = false
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

variable "index_document" {
  description = "Index document that is appended to a request that is for a directory on the website endpoint. For example, if the suffix is index.html and you make a request to samplebucket/images/, the data that is returned will be for the object with the key name images/index.html. The suffix must not be empty and must not include a slash character."
  type        = string
  default     = "index.html"
}

variable "error_document_key" {
  description = "Object key name to use when a 4XX class error occurs."
  type        = string
  default     = "error.html"
}

variable "enable_versioning" {
  description = "Versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled. Disabled should only be used when creating or importing resources that correspond to S3 buckets that is not versioned."
  type        = string
  default     = "Enabled"
}
