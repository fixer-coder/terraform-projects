# ----------------------------------------------------------------------------------------------------------------------
# CREATE THE CODEPIPELINE
# Module is tailored towards deploying from Github source to s3 bucket
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_codepipeline" "codepipeline" {
  name     = var.name
  role_arn = aws_iam_role.deploy_from_codepipeline_to_s3.arn

  artifact_store {
    location = var.s3-artifact-bucket
    type     = "S3"
  }

  dynamic "stage" {
    for_each = var.source_stage
    content {
      name = stage.value.name

      dynamic "action" {
        for_each = stage.value.action
        content {
          name             = action.value.name
          category         = action.value.category
          owner            = action.value.owner
          provider         = action.value.provider
          version          = action.value.version
          output_artifacts = action.value.output_artifacts
          configuration = {
            ConnectionArn        = var.codestar-connections-arn
            FullRepositoryId     = "${var.github-organization}/${var.github-repository}"
            BranchName           = var.github-branch
            OutputArtifactFormat = "CODE_ZIP"
          }
        }
      }
    }
  }

  dynamic "stage" {
    for_each = var.deploy_stage
    content {
      name = stage.value.name

      dynamic "action" {
        for_each = stage.value.action
        content {
          name            = action.value.name
          category        = action.value.category
          owner           = action.value.owner
          provider        = action.value.provider
          input_artifacts = action.value.input_artifacts
          version         = action.value.version
          region          = action.value.region
          configuration = {
            BucketName = var.s3-deploy-bucket
            Extract    = "true"
          }
        }
      }
    }
  }
}

# ----------------------------------------------------------------------------------------------------------------------
# CREATE IAM ROLE
# N.B: this could be implemented in it own module
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_iam_role" "deploy_from_codepipeline_to_s3" {
  name = "deploy_from_codepipeline_to_s3_tes"

  assume_role_policy  = data.aws_iam_policy_document.instance-assume-role-policy.json
  path                = "/service-role/"
  managed_policy_arns = [var.codepipeline_policy]

}
# ----------------------------------------------------------------------------------------------------------------------
# LOOKUP SPECIFIC ROLE POLICY
# ----------------------------------------------------------------------------------------------------------------------

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}
