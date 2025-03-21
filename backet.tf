resource "yandex_storage_bucket" "image_backet" {
  # access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  # secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "imag-netology116132"
  folder_id = var.cloud.folder_id
  acl = "public-read"
  website {
    index_document = "test_image"
  }
  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       kms_master_key_id = yandex_kms_asymmetric_encryption_key.kms-a.id
  #       sse_algorithm     = "aws:kms"
  #     }
  #   }
  # }
  
}

resource "yandex_storage_object" "image" {
    access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
    secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
    bucket = yandex_storage_bucket.image_backet.bucket
    key = "test_image"
    source = "./image.jpg"
    

    
}