terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
    folder_id                = var.cloud.folder_id
    zone                     = var.cloud.default_zone
    service_account_key_file = file("key.json")
}

