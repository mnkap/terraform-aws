output "rdspassword" {
  value = local.rdspassword
  sensitive = true
}

output "username" {
  value = module.rds.username
}

output "db_name" {
  value = module.rds.db_name
}

output "instance_class" {
  value = module.rds.instance_class
}