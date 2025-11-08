/*
==================================================
============= Описание ВМ ========================
==================================================
*/
variable "vm-name" {
  description = "Имя ВМ"
  type        = string
}

variable "vm-image" {
  description = "Образ использующийся для развертывания VM"
  type        = string
}

variable "vm-platform_id" {
  description = "Имя идентификатора платформы ВМ"
  type        = string
}

variable "vm-net-name" {
  description = "Имя subnet для получения ID"
  type        = string
}

variable "vm-zone" {
  description = "Зона доступности VM"
  type        = string
}

variable "vm-cpu" {
  description = "Количество ядер процессора"
  type        = number
}

variable "vm-ram" {
  description = "Размер ОЗУ ВМ"
  type        = number
}
/*
==================================================
============= Описание дисков ВМ =================
==================================================
*/
variable "disk-name" {
  description = "Имя диска на ВМ"
  type        = string
}

variable "disk-type" {
  description = "Тип используемого диска"
  type        = string
}

variable "disk-size" {
  description = "Размер диска"
  type        = number
}