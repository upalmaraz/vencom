provider "aws" {
  region = "us-east-1"
}

variable "samba" {
  default = {
    ami      = "ami-039843330ec1a5a76"
    key_name = "vencom"
  }
}
