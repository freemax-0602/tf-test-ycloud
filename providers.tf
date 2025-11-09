
# Инциализация провайдера Ycloud
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

}

# Провайдер yandex по умолчанию (зона доступности ru-central-b)
provider "yandex" {
  zone = "ru-central1-b"
}