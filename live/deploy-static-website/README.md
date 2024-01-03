<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_artifact_private_s3_bucket"></a> [artifact\_private\_s3\_bucket](#module\_artifact\_private\_s3\_bucket) | github.com/fixer-coder/terraform-projects//modules/aws/data-storages/s3/private-bucket | 4e7eb2ec0dcd8696e4d616cdef109f42e975f786 |
| <a name="module_cloudfront_distribution"></a> [cloudfront\_distribution](#module\_cloudfront\_distribution) | ../../modules/aws/services/cloudfront | n/a |
| <a name="module_codepipeline_deploy_static_website"></a> [codepipeline\_deploy\_static\_website](#module\_codepipeline\_deploy\_static\_website) | github.com/fixer-coder/terraform-projects//modules/aws/services/dev-tools/codepipeline | 46da5b0ca9b3db3f29711f9c731205efa448f196 |
| <a name="module_codepipeline_policy"></a> [codepipeline\_policy](#module\_codepipeline\_policy) | github.com/fixer-coder/terraform-projects//modules/aws/security/policies | 46da5b0ca9b3db3f29711f9c731205efa448f196 |
| <a name="module_codestart_connection"></a> [codestart\_connection](#module\_codestart\_connection) | github.com/fixer-coder/terraform-projects//modules/aws/services/dev-tools/connections | 46da5b0ca9b3db3f29711f9c731205efa448f196 |
| <a name="module_static_website_s3_bucket"></a> [static\_website\_s3\_bucket](#module\_static\_website\_s3\_bucket) | ../../modules/aws/data-storages/s3/public-bucket | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | Domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net |
| <a name="output_website_endpoint"></a> [website\_endpoint](#output\_website\_endpoint) | Website endpoint. |
<!-- END_TF_DOCS -->
