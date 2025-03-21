resource "yandex_vpc_network" "vpc" {
  name        = var.vpc
}

resource "yandex_vpc_subnet" "subnet_public" {
  network_id     = yandex_vpc_network.vpc.id
  name           = "public"
  v4_cidr_blocks = ["192.168.20.0/24"]
  zone           = var.cloud.default_zone
}

