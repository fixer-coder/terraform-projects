# ------------------- -------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the connection to be created. The name must be unique in the calling AWS account. Changing name will create a new resource."
  type        = string
}

variable "provider_type" {
  description = "The name of the external provider where your third-party code repository is configured. Valid values are Bitbucket, GitHub or GitHubEnterpriseServer. Changing provider_type will create a new resource. Conflicts with host_arn"
  type        = string
  default     = null

  validation {
    condition     = can(index(["Bitbucket", "GitHub", "GitHubEnterpriseServer"], var.provider_type)) == true
    error_message = "Invalid provider type. Valid values are Bitbucket, GitHub or GitHubEnterpriseServer."
  }
}
