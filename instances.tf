resource "aws_instance" "webservers" {
	count = "${length(var.subnets_cidr)}" 
	ami = "${var.webservers_ami}"
	key_name = "${aws_key_pair.terraform-demo.key_name}"
	instance_type = "${var.instance_type}"
	security_groups = ["${aws_security_group.webservers.id}"]
	subnet_id = "${element(aws_subnet.public.*.id,count.index)}"
	user_data = "${file("install_httpd.sh")}"

	tags = {
	  Name = "Server-${count.index}"
	}
}
