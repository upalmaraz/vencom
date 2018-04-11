resource "aws_eip" "eip_samba" {
  instance = "${aws_instance.instance_production_samba.id}"
  vpc      = true
}

resource "aws_instance" "instance_production_samba" {
  ami                    = "${var.samba["ami"]}"
  instance_type          = "t2.medium"
  key_name               = "${var.samba["key_name"]}"
  subnet_id              = "${aws_subnet.subnet_production.id}"
  vpc_security_group_ids = ["${aws_security_group.sg_default_ssh.id}"]

  depends_on = ["aws_internet_gateway.gw_production"]

  tags {
    Name    = "prod_samba"
    Project = "casapalacio"
    Stages  = "production"
    Roles   = "samba"
  }
}

output "samba_public_ip" {
  value = "${aws_eip.eip_samba.public_ip}"
}
