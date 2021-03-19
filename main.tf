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

  user_data = <<-EOF
              #!/bin/bash
              sudo echo export "DBhost=${aws_db_instance.uber-db.address}" >> /etc/environment
              sudo echo export "DBendpoint=${aws_db_instance.uber-db.endpoint}" >> /etc/environment
              sudo echo export "DBname=${var.db_name}" >> /etc/environment
              sudo echo export "DBusername=${aws_db_instance.uber-db.username}" >> /etc/environment
              sudo echo export "DBpassword=${aws_db_instance.uber-db.password}" >> /etc/environment
              EOF

  tags = {
    Name = "Backend_EC2"
   }
}

resource "aws_instance" "frontend" {
  depends_on = [ aws_db_instance.uber-db ]
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

  user_data = <<-EOF
              #!/bin/bash
              sudo echo export "DBhost=${aws_db_instance.uber-db.address}" >> /etc/environment
              sudo echo export "DBendpoint=${aws_db_instance.uber-db.endpoint}" >> /etc/environment
              sudo echo export "DBname=${var.db_name}" >> /etc/environment
              sudo echo export "DBusername=${aws_db_instance.uber-db.username}" >> /etc/environment
              sudo echo export "DBpassword=${aws_db_instance.uber-db.password}" >> /etc/environment
              EOF

  tags = {
    Name = "Webapp_EC2"
   }
}