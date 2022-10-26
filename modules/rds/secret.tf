data "aws_secretsmanager_secret" "by_arn" {
  arn = "arn:aws:secretsmanager:us-east-1:182678615463:secret:main/rds/password-cE2NPj"
}

data "aws_secretsmanager_secret_version" "rdspassword" {
  secret_id = data.aws_secretsmanager_secret.by_arn.id
}

locals {
  rdspassword = jsondecode(data.aws_secretsmanager_secret_version.rdspassword.secret_string)["password"]
}
