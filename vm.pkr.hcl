
variable "ami_id" {
  type    = string
  default = "ami-017fecd1353bcc96e"
}

locals {
    app_name = "pet1"
}

source "amazon-ebs" "nginx" {
  ami_name      = "PACKER-${local.app_name}"
  instance_type = "t2.micro"
  region        = "us-west-2"
  source_ami    = "${var.ami_id}"
  ssh_username  = "ubuntu"
  tags = {
    Env  = "DEMO"
    Name = "PACKER-${local.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.nginx"]

  provisioner "file" {
    source = "file/spring-petclinic-2.7.3.jar"
    destination = "/tmp/spring-petclinic-2.7.3.jar"
  }
  
  provisioner "shell" {
    script = "script/script.sh"
  }

  post-processor "manifest" {
    output = "manifest.json"
    strip_path = true
    }
}


