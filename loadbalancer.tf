resource "yandex_lb_network_load_balancer" "loadbalancer" {

    name = "loadbalancer"
    listener {
      name = "nlb-listener"
      port = 80
    }
  attached_target_group {
    target_group_id = "${yandex_compute_instance_group.compute_group.load_balancer.0.target_group_id}"
    healthcheck {
      name                = "health-check-1"
      unhealthy_threshold = 5
      healthy_threshold   = 5
      http_options {
        port = 80
      }
    }
  }
}
  
