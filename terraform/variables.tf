# рабочий проект
variable project { description = "infra-986808" }

# значение по умолчанию региона
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}

# ключи для подключения к хосту
variable public_key_path {
  # Описание переменной
  description = "~/.ssh/appuser.pub"
}

# диск с образом системы (заготовлен заранее)
variable disk_image {
  description = "projects/forward-karma-262407/global/images/reddit-base-1578467159"
}

variable app_domain {
  description = "otus.ru"
}
