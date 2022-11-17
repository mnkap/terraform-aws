output "rdspassword" {
  value = var.rdspassword
  sensitive = true
}

output "username" {
  value = aws_db_instance.default.username
}

output "password" {
  value = aws_db_instance.default.password
}

output "db_name" {
  value = aws_db_instance.default.db_name
}

output "instance_class" {
  value = aws_db_instance.default.instance_class
}