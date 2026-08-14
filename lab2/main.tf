# Network
module "network" {
  source = "./modules/network"
}

module "s3" {
  source = "./modules/s3"

  lab2_iam_role_log = module.iam.lab2_iam_role_log
}

module "security" {
  source = "./modules/security_group"

  lab2_vpc_id = module.network.vpc_id
}

module "iam" {
  source = "./modules/iam"

  lab2_bucket_log_arn = module.s3.lab2_bucket_log_arn
}

module "ec2" {
  source = "./modules/ec2"

  lab2_iam_role_log_id    = module.iam.lab2_iam_role_log_id
  lab2_instance_profile_name = module.iam.lab2_instance_profile_name
  lab2_vpc_id             = module.network.vpc_id
  public_subnet_1_id      = module.network.public_subnet_1_id
  public_subnet_2_id      = module.network.public_subnet_2_id
  lab2_public_sg_id       = module.security.lab2_public_sg_id
}