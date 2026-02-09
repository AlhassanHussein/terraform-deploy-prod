module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  az                   = "eu-south-2b" // spain south 1b
  project_name         = var.project_name
}

module "sg" {
  source       = "./modules/security_group"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "ec2" {
  source          = "./modules/ec2"
  subnet_id       = module.vpc.subnet_id
  sg_id           = module.sg.sg_id
  ami             = "ami-0b866972a22ef59aa" // ubuntu 24.04 LTS in eu-south-2
  instance_type   = "t3.micro"
  key_name        = "saytruthweb"
  project_name    = var.project_name
  ec2_count       = 1 // chnage to 2 if you want to create 2 EC2 instances
}
