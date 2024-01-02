# ----------------------------------------------------------------------------------------------------------------------
# CREATE THE IAM POLICY
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = var.description
  policy      = local.iam_policy_document
}

# ----------------------------------------------------------------------------------------------------------------------
# USE LOCAL AND SORT POLICY
# ----------------------------------------------------------------------------------------------------------------------
locals {
  iam_policy_document = jsonencode({
    Version = "2012-10-17",
    Statement = [
      for statement in var.iam_policy_statements : {
        Action   = statement.action,
        Effect   = "Allow",
        Resource = statement.resource,
      }
    ]
  })
}
