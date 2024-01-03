module "static_website_s3_bucket" {
  source             = "github.com/fixer-coder/terraform-projects//modules/aws/data-storages/s3/public-bucket?ref=5419b67ac457403c116e2255a948b311fbed8b89"
  name               = "static-website-codepipeline-deployer-work-tester"
  force_destroy      = true
  error_document_key = "error/error.html"
  tags = {
    "environment" : "dev"
    "team" : "DevOps"
  }
}

module "artifact_private_s3_bucket" {
  source        = "github.com/fixer-coder/terraform-projects//modules/aws/data-storages/s3/private-bucket?ref=4e7eb2ec0dcd8696e4d616cdef109f42e975f786"
  name          = "s3-codepipeline-deployer-worker-tester-iac"
  force_destroy = true
  tags = {
    "environment" : "dev"
    "team" : "DevOps"
  }
}

module "codepipeline_policy" {
  source      = "github.com/fixer-coder/terraform-projects//modules/aws/security/policies?ref=46da5b0ca9b3db3f29711f9c731205efa448f196"
  policy_name = "Deploy-static-website-to-s3"
  description = "Policy gives resource permission to write, push and read to s3 and allow connection for codestar connection"
  iam_policy_statements = [
    {
      action   = ["s3:PutObject", "s3:GetObject", "s3:PutObjectAcl"]
      resource = ["${module.static_website_s3_bucket.bucket_arn}/*", "${module.artifact_private_s3_bucket.bucket_arn}/*"]
    },
    {
      action   = ["codestar-connections:UseConnection"]
      resource = [module.codestart_connection.connection_arn]
    },
  ]
}

module "codestart_connection" {
  source        = "github.com/fixer-coder/terraform-projects//modules/aws/services/dev-tools/connections?ref=46da5b0ca9b3db3f29711f9c731205efa448f196"
  name          = "website-deployer-connection"
  provider_type = "GitHub"
}

module "codepipeline_deploy_static_website" {
  source = "github.com/fixer-coder/terraform-projects//modules/aws/services/dev-tools/codepipeline?ref=46da5b0ca9b3db3f29711f9c731205efa448f196"

  codepipeline_policy      = module.codepipeline_policy.policy_arn
  codestar-connections-arn = module.codestart_connection.connection_arn
  github-branch            = "main"
  github-organization      = "fixer-coder"
  github-repository        = "static-web"
  name                     = "DeploysStaticWebsiteToS3FromGithub"
  s3-artifact-bucket       = module.artifact_private_s3_bucket.name
  s3-deploy-bucket         = module.static_website_s3_bucket.name
  deploy_stage = [
    {
      name = "Deploy"
      action = [
        {
          name            = "Deploy"
          category        = "Deploy"
          owner           = "AWS"
          provider        = "S3"
          input_artifacts = ["source_output"]
          version         = "1"
          region          = "us-east-1"
        }
      ]

    }
  ]
  source_stage = [
    {
      name = "Source"
      action = [
        {
          name             = "Source"
          category         = "Source"
          owner            = "AWS"
          provider         = "CodeStarSourceConnection"
          version          = "1"
          output_artifacts = ["source_output"]
        }
      ]
    }
  ]
}

module "cloudfront_distribution" {
  source = "github.com/fixer-coder/terraform-projects//modules/aws/services/cloudfront?ref=5419b67ac457403c116e2255a948b311fbed8b89"

  cloudfront_origin_access_identity_comment = "OAI for static website"
  bucket_regional_domain_name               = module.static_website_s3_bucket.bucket_regional_domain_name
}
