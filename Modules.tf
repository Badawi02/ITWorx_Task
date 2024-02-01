# ================= vpc module  ===============
module "vpc" {
    source = "./vpc"
    cidr_block_vpc = "10.0.0.0/16"
    Name_vpv = "simple-web-app"
}

# ================= internet_getway module  ===============
module "internet_getway" {
    source = "./internet_getway"
    Name_IGW = "Web-IGW"
    vpcID = module.vpc.vpc-id
}

# ================= subnet module  ===============
module "subnet" {
    source = "./subnet"
    vpcId = module.vpc.vpc-id
    subnet_cidr = "10.0.0.0/24"
    az = "us-east-1a"
    subnetName = "webserver-subnet"
}

# ================= route_table_public module  ===============
module "route-table-public" {
  source = "./route-table-public"
  vpcID = module.vpc.vpc-id
  gwID = module.internet_getway.IGW
  Name_route_table = "route-table-webserver"
  subnetID = module.subnet.subnet_id
  cidr_block_route_table = "0.0.0.0/0"
}

# ================= security_group_public module  ===============
module "security_group_public" {
    source = "./security-group-public"
    Name_security_group = "webserver-sg"
    Ports_security_group = [80 , 22 , 0]
    Protocol_security_group = ["tcp" , "-1"] 
    cidr_security_group = "0.0.0.0/0"
    vpcID = module.vpc.vpc-id
}

# ================= public_ec2 module  ===============
module "ec2_public" {
  source = "./ec2-public"
  instance_type = "t3a.micro"
  associate_public_ip_address = "true"
  subnetID = module.subnet.subnet_id
  secGroupId = [module.security_group_public.security_group_id]
  public_ec2 = "Web_Server"
  userData = file("userData.sh")
}