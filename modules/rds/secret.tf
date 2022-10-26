data "aws_secretsmanager_secret" "rdspassword" {
  name = "main/rds/password"
}

data "aws_secretsmanager_secret_version" "rdspassword" {
  secret_id = data.aws_secretsmanager_secret.rdspassword.id
}

locals {
  rdspassword = jsondecode(data.aws_secretsmanager_secret_version.rdspassword.secret_string)["password"]
}
