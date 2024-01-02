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
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the IAM policy | `string` | n/a | yes |
| <a name="input_iam_policy_statements"></a> [iam\_policy\_statements](#input\_iam\_policy\_statements) | List of policy statements<br>    iam\_policy\_statements = [<br>      {<br>        action   = ["s3:PutObject", "s3:GetObject", "s3:PutObjectAcl"]<br>        resource = ["arn:aws:s3:::bucket-name/*"]<br>      },<br>      {<br>        action   = ["codestar-connections:UseConnection"]<br>        resource = ["arn:aws:codestar-connections:us-east-1:xxx:connection/c2d9de8d"]<br>      },<br>    ] | <pre>list(object({<br>    action   = list(string)<br>    resource = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The name of policy you want to create | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | Arn of Policy |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | Id of policy |
<!-- END_TF_DOCS -->