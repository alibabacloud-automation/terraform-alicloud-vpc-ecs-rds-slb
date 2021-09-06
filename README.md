Alicloud VPC&ECS&RDS&SLB Terraform Module On Alibaba Cloud

terraform-alicloud-vpc-ecs-rds-slb
---

English | [简体中文](README-CN.md)

This module is used to create a lightweight web service under Alibaba Cloud VPC, ECS, RDS and SLB.

These types of resources are supported:

* [alicloud_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/instance)
* [alicloud_db_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/db_instance)
* [alicloud_slb_load_balancer](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb_load_balancer)
* [alicloud_vpc](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc)

## Usage

```hcl
module "example" {
  source            = "terraform-alicloud-modules/vpc-ecs-rds-slb/alicloud"
  name              = "tf-eip-slb-ecs-rds"
  instance_type     = "ecs.sn2ne.large"
  rds_instance_type = "rds.mysql.s3.large"
  slb_address_type  = "intranet"
}
```

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.123.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.123.1 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Will(ppnjy@qq.com)

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
