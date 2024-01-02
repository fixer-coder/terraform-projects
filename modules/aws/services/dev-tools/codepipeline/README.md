<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_codepipeline.codepipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_iam_role.deploy_from_codepipeline_to_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy_document.instance-assume-role-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codepipeline_policy"></a> [codepipeline\_policy](#input\_codepipeline\_policy) | Code Pipeline policy needed to interact with other resources | `string` | n/a | yes |
| <a name="input_codestar-connections-arn"></a> [codestar-connections-arn](#input\_codestar-connections-arn) | Arn of codestar connection to use by codepipeline to connect to github | `string` | n/a | yes |
| <a name="input_deploy_stage"></a> [deploy\_stage](#input\_deploy\_stage) | Deploy stage for code pipeline<br>    deploy\_stage = [<br>      name = "Deploy"<br><br>      action {<br>        name            = "Deploy"<br>        category        = "Deploy"<br>        owner           = "AWS"<br>        provider        = "S3"<br>        input\_artifacts = ["source\_output"]<br>        version         = "1"<br>        region          = "us-east-1"<br>      }<br>    ] | <pre>list(object({<br>    name = optional(string)<br>    action = list(object({<br>      name            = optional(string)<br>      category        = optional(string)<br>      owner           = optional(string)<br>      provider        = optional(string)<br>      version         = optional(string)<br>      input_artifacts = optional(list(string))<br>      region          = optional(string)<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_github-branch"></a> [github-branch](#input\_github-branch) | The git hub branch where we want Codepipeline to get code from | `string` | n/a | yes |
| <a name="input_github-organization"></a> [github-organization](#input\_github-organization) | Organisation of Github to use | `string` | n/a | yes |
| <a name="input_github-repository"></a> [github-repository](#input\_github-repository) | Repository where code is kept | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the CodePipeline | `string` | n/a | yes |
| <a name="input_s3-artifact-bucket"></a> [s3-artifact-bucket](#input\_s3-artifact-bucket) | S3 bucket for storing build artifacts | `string` | n/a | yes |
| <a name="input_s3-deploy-bucket"></a> [s3-deploy-bucket](#input\_s3-deploy-bucket) | S3 bucket for to deploy to | `string` | n/a | yes |
| <a name="input_source_stage"></a> [source\_stage](#input\_source\_stage) | Source stage for code pipeline<br>    source\_stage = [<br>      name = "Source"<br><br>      action {<br>        name             = "Source"<br>        category         = "Source"<br>        owner            = "AWS"<br>        provider         = "CodeStarSourceConnection"<br>        version          = "2"<br>        output\_artifacts = ["source\_output"]<br>        configuration = {<br>          OutputArtifactFormat = "CODE\_ZIP"<br>        }<br>      }<br>    ] | <pre>list(object({<br>    name = optional(string)<br>    action = list(object({<br>      name             = optional(string)<br>      category         = optional(string)<br>      owner            = optional(string)<br>      provider         = optional(string)<br>      version          = optional(string)<br>      output_artifacts = optional(list(string))<br>      configuration = optional(list(object({<br>        OutputArtifactFormat = optional(string)<br>      })))<br><br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codepipeline_name"></a> [codepipeline\_name](#output\_codepipeline\_name) | The name of the created CodePipeline |
<!-- END_TF_DOCS -->