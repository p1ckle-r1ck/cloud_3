resource "yandex_compute_instance_group" "compute_group" {
    name = "group"
    scale_policy {
      fixed_scale {
      size = 3
        }
    }
    service_account_id = "aje6fmubn056nrgoi2f3"
    

    allocation_policy {
      zones = [var.cloud.default_zone]
    }

    deploy_policy {
    max_unavailable = 2
    max_creating    = 2
    max_expansion   = 2
    max_deleting    = 2
    }

    instance_template {
      boot_disk {
        initialize_params {
          image_id = "fd827b91d99psvq5fjit"
          size = 3
        }
        
      }
      network_interface {
        network_id = yandex_vpc_network.vpc.id
        subnet_ids = ["${yandex_vpc_subnet.subnet_public.id}"]
        nat = true 
      }
      resources {
        memory = var.nat_instance_vars.memory
        cores = var.nat_instance_vars.cores

      }
      metadata = {
        user-data = "${file("nginx.yml")}"
      }
      
    }
    load_balancer {
      target_group_name = "nlb-tg"
    }
  
}