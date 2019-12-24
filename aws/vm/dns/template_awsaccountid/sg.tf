data "aws_vpc" "vpc" {
  id = "vpc-0b026c1a78089ad9c"
}

resource "aws_security_group" "sg" {
  name        = "DNS-SLAVE-SG"
  description = "Allow port 22 , 53 to private subnet"
  vpc_id      = "${data.aws_vpc.vpc.id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16","10.0.0.0/8"]
  }
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16","10.0.0.0/8"]
  }
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["192.168.0.0/16","10.0.0.0/8"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DNS-SLAVE-SG"
  }
}