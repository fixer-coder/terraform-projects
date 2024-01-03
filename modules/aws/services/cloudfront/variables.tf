# ------------------- -------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "cloudfront_origin_access_identity_comment" {
  description = "Comment for the origin access identity."
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name. Please refer to the S3 endpoints reference for format. Note: AWS CloudFront allows specifying an S3 region-specific endpoint when creating an S3 origin. This will prevent redirect issues from CloudFront to the S3 Origin URL. For more information, see the Virtual Hosted-Style Requests for Other Regions section in the AWS S3 User Guide."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# Generally, these values won't need to be changed.
# ---------------------------------------------------------------------------------------------------------------------

variable "default_root_object" {
  description = "Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type        = string
  default     = "index.html"
}

variable "allowed_methods" {
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
  default     = ["GET", "HEAD"]
  type        = list(string)
}

variable "cached_methods" {
  description = " Controls whether CloudFront caches the response to requests using the specified HTTP methods."
  default     = ["GET", "HEAD"]
  type        = list(string)
}
