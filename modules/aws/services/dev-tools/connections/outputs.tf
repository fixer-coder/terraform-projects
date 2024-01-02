output "connection_arn" {
  description = "The codestar connection ARN."
  value       = aws_codestarconnections_connection.connection.arn
}

output "connection_status" {
  description = "The codestar connection status. Possible values are PENDING, AVAILABLE and ERROR."
  value       = aws_codestarconnections_connection.connection.connection_status
}
