# The aws_codestarconnections_connection resource is created in the state PENDING.
# Authentication with the connection provider must be completed in the AWS Console.
# See the AWS documentation for details.
# ----------------------------------------------------------------------------------------------------------------------
# CREATE CODESTAR CONNECTION
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_codestarconnections_connection" "connection" {
  name          = var.name
  provider_type = var.provider_type
}
