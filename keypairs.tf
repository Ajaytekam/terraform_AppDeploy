# generate the public-private key
resource "tls_private_key" "pk-generate" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# store the generated private key in local disk
resource "local_file" "privateKey_pem" {
  filename = "vprofilekey.pem"
  content  = tls_private_key.pk-generate.private_key_pem
}

# create aws key-pair 
resource "aws_key_pair" "vprofilekey" {
  key_name   = "vprofilekey"
  public_key = tls_private_key.pk-generate.public_key_openssh
}

/* 
Or you can also go for manual method 



*/  