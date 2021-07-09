#creating aws ec2 instance 

resource "aws_instance" "webserver" {
  ami           = lookup(var.ami, var.region)
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private.id
  vpc_security_group_ids = [
    "${aws_security_group.webserver_sg.name}"
  ]
  key_name  = var.keyname
  user_data = <<-EOF
    #!/bin/bash -xe
    sudo yum install httpd -y
    sudo echo "<h1>sample webserver using terraform</h1>" > /var/www/html/index.html
    sudo systemctl enable httpd
    sudo systemctl restart httpd
  EOF

  tags = {
    Name     = "Sample-Webserver"
    Location = "USA"
  }
}
