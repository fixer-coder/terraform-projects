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
| [aws_codestarconnections_connection.connection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codestarconnections_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the connection to be created. The name must be unique in the calling AWS account. Changing name will create a new resource. | `string` | n/a | yes |
| <a name="input_provider_type"></a> [provider\_type](#input\_provider\_type) | The name of the external provider where your third-party code repository is configured. Valid values are Bitbucket, GitHub or GitHubEnterpriseServer. Changing provider\_type will create a new resource. Conflicts with host\_arn | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_arn"></a> [connection\_arn](#output\_connection\_arn) | The codestar connection ARN. |
| <a name="output_connection_status"></a> [connection\_status](#output\_connection\_status) | The codestar connection status. Possible values are PENDING, AVAILABLE and ERROR. |
<!-- END_TF_DOCS -->