# ------------------- -------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the CodePipeline"
  type        = string
}

variable "codestar-connections-arn" {
  description = "Arn of codestar connection to use by codepipeline to connect to github"
  type        = string
}

variable "s3-artifact-bucket" {
  description = "S3 bucket for storing build artifacts"
  type        = string
}

variable "s3-deploy-bucket" {
  description = "S3 bucket for to deploy to"
  type        = string
}

variable "github-branch" {
  description = "The git hub branch where we want Codepipeline to get code from"
  type        = string
}

variable "github-organization" {
  description = "Organisation of Github to use"
  type        = string
}

variable "github-repository" {
  description = "Repository where code is kept"
  type        = string
}

variable "codepipeline_policy" {
  description = "Code Pipeline policy needed to interact with other resources"
  type        = string
}

variable "source_stage" {
  description = <<EOF
    Source stage for code pipeline
    source_stage = [
      name = "Source"

      action {
        name             = "Source"
        category         = "Source"
        owner            = "AWS"
        provider         = "CodeStarSourceConnection"
        version          = "2"
        output_artifacts = ["source_output"]
        configuration = {
          OutputArtifactFormat = "CODE_ZIP"
        }
      }
    ]
EOF
  type = list(object({
    name = optional(string)
    action = list(object({
      name             = optional(string)
      category         = optional(string)
      owner            = optional(string)
      provider         = optional(string)
      version          = optional(string)
      output_artifacts = optional(list(string))
      configuration = optional(list(object({
        OutputArtifactFormat = optional(string)
      })))

    }))
  }))
}

variable "deploy_stage" {
  description = <<EOF
    Deploy stage for code pipeline
    deploy_stage = [
      name = "Deploy"

      action {
        name            = "Deploy"
        category        = "Deploy"
        owner           = "AWS"
        provider        = "S3"
        input_artifacts = ["source_output"]
        version         = "1"
        region          = "us-east-1"
      }
    ]
EOF
  type = list(object({
    name = optional(string)
    action = list(object({
      name            = optional(string)
      category        = optional(string)
      owner           = optional(string)
      provider        = optional(string)
      version         = optional(string)
      input_artifacts = optional(list(string))
      region          = optional(string)
    }))
  }))
}
