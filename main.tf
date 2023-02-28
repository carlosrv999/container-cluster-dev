data "huaweicloud_availability_zones" "zones" {}

module "cce" {
  source  = "app.terraform.io/canvia-cloud/cce/huaweicloud"
  version = "2.0.2"

  availability_zone_cluster   = data.huaweicloud_availability_zones.zones.names[0]
  availability_zone_nodegroup = data.huaweicloud_availability_zones.zones.names[0]
  name                        = "cce-demo-canvia"
  region                      = var.region
  service_network_cidr        = "10.247.32.0/20"
  container_network_cidr      = "172.18.0.0/16"
  node_root_password          = var.node_root_password
  node_group_name             = "node-group-canvia"
  node_group_flavor_id        = "c6s.xlarge.2"
  os_nodes                    = "EulerOS 2.9"
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id

  tags = local.common_tags
}

resource "local_file" "kubeconfig" {
  content  = module.cce.kubeconfig
  filename = "kubeconfig.json"
}
