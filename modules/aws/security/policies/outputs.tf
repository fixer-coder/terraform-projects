output "policy_arn" {
  description = "Arn of Policy"
  value       = aws_iam_policy.policy.arn
}

output "policy_id" {
  description = "Id of policy"
  value       = aws_iam_policy.policy.id
}
