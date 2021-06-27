data "aws_vpcs" "current_vpc" {}
data "aws_vpc" "current_vpc" {
  count = length(data.aws_vpcs.current_vpc.ids)
  id    = tolist(data.aws_vpcs.current_vpc.ids)[count.index]
}


resource "aws_security_group" "web" {
  count       = length(data.aws_vpcs.current_vpc.ids)
  name_prefix = "${var.server_name}-WebServer-SG"
  #vpc_id      = data.aws_vpcs.current_vpc.id
  vpc_id = data.aws_vpc.current_vpc[count.index].id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.server_name}-WebServer SecurityGroup"
    Owner       = "${var.owner}"
    Environment = "${var.env}"
  }
}
