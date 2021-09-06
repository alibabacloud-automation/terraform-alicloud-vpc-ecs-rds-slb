resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = var.vpc_cidr_block
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = var.vs_cidr_block
  vpc_id       = alicloud_vpc.default.id
  zone_id      = var.availability_zone
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = alicloud_vpc.default.id
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = var.name
  address_type       = var.slb_address_type
  load_balancer_spec = var.slb_spec
  vswitch_id         = alicloud_vswitch.default.id
  tags               = {
    info = var.slb_tags_info
  }
}

resource "alicloud_instance" "default" {
  availability_zone          = var.availability_zone
  instance_name              = var.name
  security_groups            = [alicloud_security_group.default.id]
  vswitch_id                 = alicloud_vswitch.default.id
  instance_type              = var.instance_type
  system_disk_category       = var.system_disk_category
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = var.image_id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  data_disks {
    name        = var.name
    size        = var.ecs_size
    category    = var.category
    description = var.description
    encrypted   = true
  }
}

resource "alicloud_db_instance" "default" {
  instance_name        = var.name
  vswitch_id           = alicloud_vswitch.default.id
  engine               = var.engine
  engine_version       = var.engine_version
  instance_type        = var.rds_instance_type
  instance_storage     = var.instance_storage
  instance_charge_type = var.instance_charge_type
  monitoring_period    = var.monitoring_period
}
