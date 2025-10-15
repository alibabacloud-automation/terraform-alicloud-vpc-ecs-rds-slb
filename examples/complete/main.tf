provider "alicloud" {
  region = "ap-southeast-5"
}

data "alicloud_db_zones" "default" {
  engine         = "MySQL"
  engine_version = "5.6"
}

locals {
  zone_id = data.alicloud_db_zones.default.zones[0].id
}

data "alicloud_images" "default" {
  owners        = "system"
  most_recent   = true
  instance_type = data.alicloud_instance_types.default.instance_types[0].id
}

data "alicloud_instance_types" "default" {
  availability_zone    = local.zone_id
  cpu_core_count       = 2
  memory_size          = 8
  instance_type_family = "ecs.g9i"
}

data "alicloud_db_instance_classes" "default" {
  engine         = "MySQL"
  engine_version = "5.6"
}

module "example" {
  source = "../.."

  #alicloud_vpc snd alicloud_vswitch
  name              = var.name
  vpc_cidr_block    = "172.16.0.0/16"
  vs_cidr_block     = "172.16.0.0/21"
  availability_zone = local.zone_id

  #alicloud_slb_load_balancer
  slb_address_type = "intranet"
  slb_spec         = var.slb_spec
  slb_tags_info    = var.slb_tags_info

  #alicloud_instance
  instance_type              = data.alicloud_instance_types.default.instance_types[0].id
  system_disk_category       = "cloud_essd"
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = data.alicloud_images.default.images[0].id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  ecs_size                   = 1200
  data_disks_name            = "data_disks_name"
  category                   = "cloud_essd"
  description                = "tf-vpc-ecs-description"
  encrypted                  = true

  #alicloud_db_instance
  engine               = "MySQL"
  engine_version       = "5.6"
  rds_instance_type    = data.alicloud_db_instance_classes.default.instance_classes[1].instance_class
  instance_storage     = var.instance_storage
  instance_charge_type = var.instance_charge_type
  monitoring_period    = var.monitoring_period

}