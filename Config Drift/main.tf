provider "aws" {
  version = "~> 2.44"
  profile = "nexus-qa"
  region  = "us-east-1"
}

data "aws_ami" "bv_ami" {
  most_recent = true
  filter{
    name = "name"
    values = ["bv/amzn2-ami-hvm-2.0.*"]
  }
  owners = ["549050352176"]
}

resource "aws_instance" "helloworld"{
    ami = data.aws_ami.bv_ami.id
    instance_type = "t2.micro"
    subnet_id = "subnet-99aaf0b2"
    count = 2
    tags = {
        Name = "Helloworld"
        "bv:nexus:team" = "content-api-dev@bazaarvoice.com"
        "bv:nexus:vpc" = "qa"
    }
}