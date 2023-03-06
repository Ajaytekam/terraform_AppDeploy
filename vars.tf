variable "AWS_REGION" {
  default = "us-east-1"
}

// ami and other settings for bastian host  
variable "AMI" {
  type = map(any)
  default = {
    us-east-1 = "ami-0557a15b87f6559cf"
  }
}

variable "PRIV_KEY_PATH" {
  default = "vprofilekey.pem"
}

// by default the public key is not written as a file
// to do that just modify the keypairs.tf file 
variable "PUB_KEY_PATH" {
  default = "vprofilekey.pub"
}

variable "USERNAME" {
  default = "ubuntu"
}

// user isp public ip
variable "MYIP" {
  default = "0.0.0.0/0"
  // You can also set your own ip address 
  // to get your ip address visit https://www.whatismyip.com/
  // default = "27.6.40.45/32"
}

variable "rmquser" {
  default = "rabbit"
}

variable "rmqpass" {
  default = "admin123VPRO"
}

variable "dbuser" {
  default = "admin"
}

variable "dbpass" {
  default = "admin123"
}
variable "dbname" {
  default = "accounts"
}

variable "instance_count" {
  default = "1"
}

variable "VPC_NAME" {
  default = "vprofile-VPC"
}

variable "Zone1" {
  default = "us-east-1a"
}

variable "Zone2" {
  default = "us-east-1b"
}

variable "Zone3" {
  default = "us-east-1c"
}

variable "VpcCIDR" {
  default = "172.21.0.0/16"
}

variable "PubSub1DIR" {
  default = "172.21.1.0/24"
}

variable "PubSub2DIR" {
  default = "172.21.2.0/24"
}

variable "PubSub3DIR" {
  default = "172.21.3.0/24"
}

variable "PriSub1DIR" {
  default = "172.21.4.0/24"
}

variable "PriSub2DIR" {
  default = "172.21.5.0/24"
}

variable "PriSub3DIR" {
  default = "172.21.6.0/24"
}
