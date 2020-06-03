#      ______    _____   ___  
#     |  ____|  / ____| |__ \ 
#     | |__    | |         ) |
#     |  __|   | |        / / 
#     | |____  | |____   / /_ 
#     |______|  \_____| |____| 

module "rke-ec2" {

  source = "jason-morsley/ec2/aws"

  name = "rke"

  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  vpc_id = module.rke-vpc.id

  public_subnet_id = module.rke-vpc.public_subnet_ids[0]

  security_group_ids = [ module.rke-security-group.id ]

  availability_zone = data.aws_availability_zones.available.names[0]

  bucket_name = local.name
  
  tags = local.cluster_id_tag  
  
}