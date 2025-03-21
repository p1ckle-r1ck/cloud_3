resource "yandex_iam_service_account" "sa" {
  name = "sa-storage"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-admin" {
  folder_id = var.cloud.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}


