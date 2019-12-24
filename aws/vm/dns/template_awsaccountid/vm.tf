

data "aws_subnet" "Private_Subnet" {
  id = "subnet-xxxxxxxxxx"
}

resource "aws_network_interface" "nic" {
  subnet_id   = "${data.aws_subnet.Private_Subnet.id}"
  private_ips = ["10.60.2.174"]
  security_groups = ["${aws_security_group.sg.id}"]
  tags = {
    Name = "${var.vm_name}_network_interface"
  }
}

resource "aws_instance" "vm" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  
  network_interface {
    network_interface_id = "${aws_network_interface.nic.id}"
    device_index         = 0
  }

  tags = {
    Name = "${var.vm_name}"
  }
  
}


resource "null_resource" "bootstrap" {
  provisioner "remote-exec" {
  
    script = "${path.cwd}/bootstrap.sh"
    connection {
      host        = "${aws_instance.vm.private_ip}"
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("${path.cwd}/aws-global-hksysmgmt.pem")}"
    }
  }
  depends_on = [aws_instance.vm]
}