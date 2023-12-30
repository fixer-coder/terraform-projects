<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_static_website"></a> [static\_website](#module\_static\_website) | ../../modules/aws/data-storages/s3/public-bucket | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_bucket_arn"></a> [public\_bucket\_arn](#output\_public\_bucket\_arn) | ARN of the S3 bucket |
| <a name="output_public_bucket_name"></a> [public\_bucket\_name](#output\_public\_bucket\_name) | Name of the S3 bucket |
| <a name="output_website_domain"></a> [website\_domain](#output\_website\_domain) | Domain of the website endpoint. This is used to create Route 53 alias records. |
| <a name="output_website_endpoint"></a> [website\_endpoint](#output\_website\_endpoint) | Website endpoint. |
<!-- END_TF_DOCS -->