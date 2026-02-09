

resource "aws_instance" "this" {
  count         = var.ec2_count
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name      = var.key_name

  tags = {
    Name = "${var.project_name}-ec2-${count.index + 1}"
  }
}
resource "aws_eip" "this" {
  count    = var.ec2_count
  instance = aws_instance.this[count.index].id
  tags = {
    Name = "${var.project_name}-eip-${count.index + 1}"
  }
}