# AWS Simple Network 

This module provisions a simple AWS VPC with the following components:

- **Public Subnet**: A subnet that is accessible from the internet.
- **Private Subnets**: Two subnets that are not accessible from the internet.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.snet_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.snet_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.snet_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | n/a | `string` | `"10.0.0.0/16"` | no |
| <a name="input_create_private_snet"></a> [create\_private\_snet](#input\_create\_private\_snet) | n/a | `bool` | `true` | no |
| <a name="input_create_public_snet"></a> [create\_public\_snet](#input\_create\_public\_snet) | n/a | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"vpc-main"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"ca-central-1"` | no |
| <a name="input_snet_private_cidr"></a> [snet\_private\_cidr](#input\_snet\_private\_cidr) | n/a | `string` | `"10.0.101.0/24"` | no |
| <a name="input_snet_private_cidr_b"></a> [snet\_private\_cidr\_b](#input\_snet\_private\_cidr\_b) | n/a | `string` | `"10.0.102.0/24"` | no |
| <a name="input_snet_public_cidr"></a> [snet\_public\_cidr](#input\_snet\_public\_cidr) | n/a | `string` | `"10.0.100.0/24"` | no |

## Outputs

No outputs.
