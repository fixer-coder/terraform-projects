<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | ~> 4.0   |

## Modules

| Name                                                                          | Source                                                                                | Version                                  |
| ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ---------------------------------------- |
| <a name="module_static_website"></a> [static_website](#module_static_website) | github.com/fixer-coder/terraform-projects//modules/aws/data-storages/s3/public-bucket | adc92e920f9e066c19a3f50b05c130c22b1367f0 |

## Outputs

| Name                                                                                      | Description                                                                    |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| <a name="output_public_bucket_arn"></a> [public_bucket_arn](#output_public_bucket_arn)    | ARN of the S3 bucket                                                           |
| <a name="output_public_bucket_name"></a> [public_bucket_name](#output_public_bucket_name) | Name of the S3 bucket                                                          |
| <a name="output_website_domain"></a> [website_domain](#output_website_domain)             | Domain of the website endpoint. This is used to create Route 53 alias records. |
| <a name="output_website_endpoint"></a> [website_endpoint](#output_website_endpoint)       | Website endpoint.                                                              |

<!-- END_TF_DOCS -->
