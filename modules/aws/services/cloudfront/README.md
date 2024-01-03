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
| [aws_cloudfront_distribution.cloudfront_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.oai](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#input\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. Please refer to the S3 endpoints reference for format. Note: AWS CloudFront allows specifying an S3 region-specific endpoint when creating an S3 origin. This will prevent redirect issues from CloudFront to the S3 Origin URL. For more information, see the Virtual Hosted-Style Requests for Other Regions section in the AWS S3 User Guide. | `string` | n/a | yes |
| <a name="input_cloudfront_origin_access_identity_comment"></a> [cloudfront\_origin\_access\_identity\_comment](#input\_cloudfront\_origin\_access\_identity\_comment) | Comment for the origin access identity. | `string` | n/a | yes |
| <a name="input_allowed_methods"></a> [allowed\_methods](#input\_allowed\_methods) | Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD"<br>]</pre> | no |
| <a name="input_cached_methods"></a> [cached\_methods](#input\_cached\_methods) | Controls whether CloudFront caches the response to requests using the specified HTTP methods. | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD"<br>]</pre> | no |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL. | `string` | `"index.html"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | Domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net |
<!-- END_TF_DOCS -->