# EC2 instance for backend
resource "aws_instance" "backend" {
  depends_on = [ aws_db_instance.uber-db ]
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  key_name               = "${var.ssh_key}"
  vpc_security_group_ids = ["${aws_security_group.application_security_group.id}"]
  subnet_id              = "${aws_subnet.public_subnet[0].id}"

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = "20"
  }

  tags = {
    Name = "Backend_EC2"
   }
}

# EC2 instance for Frontend
resource "aws_instance" "frontend" {
  depends_on = [ aws_instance.backend ]
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  key_name               = "${var.ssh_key}"
  vpc_security_group_ids = ["${aws_security_group.application_security_group.id}"]
  subnet_id              = "${aws_subnet.public_subnet[1].id}"

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = "20"
  }

  tags = {
    Name = "Frontend_EC2"
   }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.backend.id
  public_ip     = var.elastic_ip
}
