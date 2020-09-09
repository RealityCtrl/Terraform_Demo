provider "aws" {
  version = "~> 2.44"
  profile = "nexus-qa"
  region  = "us-east-1"
}

resource "aws_instance" "helloworld"{
    ami = "ami-059c4545503330f61"
    instance_type = "t2.micro"
    subnet_id = "subnet-99aaf0b2"
    tags = {
        Name = "Helloworld"
    }
}