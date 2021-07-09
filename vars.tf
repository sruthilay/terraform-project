variable "keyname" {
  default = "webserver"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "region" {
  default = "us-west-2"
}

variable "ami" {
  default = {
    us-west-2 = "ami-0b28dfc7adc325ef4"
  }
}

variable "name" {
  default = "TerraformTest"
}
