terraform {
  backend "s3" {
    bucket = "terraform-vprofile-state01"
    key    = "terraform/backend"
    // you can't use var.AWS_REGION variable here
    region = "us-east-1"
  }
}
