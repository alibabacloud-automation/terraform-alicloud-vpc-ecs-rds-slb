#alicloud_vpc snd alicloud_vswitch
name = "update-tf-vpc-ecs-rds-slb-name"

#alicloud_slb_load_balancer
slb_spec      = "slb.s3.small"
slb_tags_info = "update-slb-tag-info"

#alicloud_instance
system_disk_name           = "test_system_disk"
system_disk_description    = "test_system_disk_description"
internet_max_bandwidth_out = "20"

#alicloud_db_instance
instance_storage  = "50"
monitoring_period = "5"