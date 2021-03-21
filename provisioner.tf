resource "null_resource" "frontend_provisioner" {

  connection {
    type        = "ssh"
    host        = "${aws_instance.frontend.public_ip}"
    user        = "ubuntu"
    private_key = "${file("${var.private_key_path}")}"
    timeout     = "10m"
  }

  provisioner "remote-exec" {
    inline = [
            "sudo apt-get update",
            "curl -fsSL https://get.docker.com -o get-docker.sh",
            "sudo sh get-docker.sh",
            "sudo docker run -d -p 3000:80 nareshagrawal/uberfrontend"
	  ]
  }

} 

resource "null_resource" "backend_provisioner" {

  connection {
    type        = "ssh"
    host        = "${var.elastic_ip}"
    user        = "ubuntu"
    private_key = "${file("${var.private_key_path}")}"
    timeout     = "10m"
  }

  provisioner "remote-exec" {
    inline = [
        "sudo apt-get update",
        "curl -fsSL https://get.docker.com -o get-docker.sh",
        "sudo sh get-docker.sh",
        "sudo docker run -d -e DBendpoint=${aws_db_instance.uber-db.endpoint} -e DBname=${var.db_name} -e DBusername=${var.db_user_name} -e DBpassword=${var.db_password} -p 8080:8080 nareshagrawal/uberbackend"
	  ]
  }

}