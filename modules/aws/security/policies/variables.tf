# ------------------- -------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "policy_name" {
  description = "The name of policy you want to create"
  type        = string
}

variable "description" {
  description = "Description of the IAM policy"
  type        = string
}

variable "iam_policy_statements" {
  description = <<EOF
    List of policy statements
    iam_policy_statements = [
      {
        action   = ["s3:PutObject", "s3:GetObject", "s3:PutObjectAcl"]
        resource = ["arn:aws:s3:::bucket-name/*"]
      },
      {
        action   = ["codestar-connections:UseConnection"]
        resource = ["arn:aws:codestar-connections:us-east-1:xxx:connection/c2d9de8d"]
      },
    ]
  EOF
  type = list(object({
    action   = list(string)
    resource = list(string)
  }))
}
