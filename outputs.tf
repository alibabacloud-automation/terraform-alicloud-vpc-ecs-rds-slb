output "this_ecs_id" {
  value = alicloud_instance.default.id
}

output "this_rds_id" {
  value = alicloud_db_instance.default.id
}

output "this_slb_id" {
  value = alicloud_slb_load_balancer.default.id
}

output "this_vpc_id" {
  value = alicloud_vpc.default.id
}

output "this_ecs_name" {
  value = alicloud_instance.default.instance_name
}