#       _____                      _ _         
#      / ____|                    (_) |        
#     | (___   ___  ___ _   _ _ __ _| |_ _   _ 
#      \___ \ / _ \/ __| | | | '__| | __| | | |
#      ____) |  __/ (__| |_| | |  | | |_| |_| |
#     |_____/ \___|\___|\__,_|_|  |_|\__|\__, |
#            _____                        __/ |
#           / ____|                      |___/ 
#          | |  __ _ __ ___  _   _ _ __  
#          | | |_ | '__/ _ \| | | | '_ \ 
#          | |__| | | | (_) | |_| | |_) |
#           \_____|_|  \___/ \__,_| .__/ 
#                                 | |    
#                                 |_|    

module "rke-security-group" {

  source = "./../../../terraform-aws-security-group"

  name = "rke"
  description = "To allow web traffic."

  vpc_id = module.rke-vpc.id

  ingress = [
    {
      description = "Allow Web (insecure)"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = [ var.all_cidr_block ]
    },
    {
      description = "Allow Web (secure)"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = [ var.all_cidr_block ]
    }
  ]

  egress = [{
    description = "Allow All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ var.all_cidr_block ]
  }]

  tags = local.cluster_id_tag  
}