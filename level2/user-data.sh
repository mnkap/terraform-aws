#!/bin/bash
  yum update -y
  yum install -y httpd 
  yum install -y git
  git clone https://github.com/gabrielecirulli/2048.git
  sudo cp -R 2048/* /var/www/html/
  systemctl start httpd && systemctl enable httpd
  