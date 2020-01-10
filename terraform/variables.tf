variable project {
  description = "infra-986808"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west-1"
}
variable public_key_path {
  # Описание переменной
  description = "~/.ssh/appuser.pub"
}
variable disk_image {
  description = "projects/forward-karma-262407/global/images/reddit-base-1578467159"
}
