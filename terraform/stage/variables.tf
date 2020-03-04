# рабочий проект
variable project {
  description = "infra-986808"
  default     = "infra-986808"
}

# значение по умолчанию региона
variable region {
  description = "Значение по умолчанию Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "# ключи для подключения к хосту ~/.ssh/appuser"
  default     = "~/.ssh/appuser.pub"
}

variable public_key {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAz/rcMpufleSEpnDF+Mz66A7Y/S4osC+4L/FqQUc+laUmKhIg8DqUhDn7bzKTXXjfObL4eHGUcYJxGaLgwPQL/T3R1Yq+SfsLSmpr2OvBnk3Sw8Di8sA935t0bKL1P+aWfnJr3YrpNMdKduIQsLTWb3NFrYwZLvnScJL1EVSgqVREVdUti0KUfa+1YEgEZ9iM930jWUmwUmWg0fpubVqT/DHcSUdWXSaJFNyencFJxNG12CsnwjV0Y1qlV7ugoRjVPcWaTk/4XQqRFLeeb0bwvnLohv1T+J24KFNo3P7pTdc+KjJVhd3kSGUPZ3r33HPPVLDXeNd/nwHX0fNgWodlRQ== appuser"
}

variable disk_image {
  description = "диск с образом системы (заготовлен заранее)"
  default     = "projects/forward-karma-262407/global/images/reddit-base-1578467159"
}

variable app_domain {
  description = "неизвостно как используется"
  default     = "otus.ru"
}


variable app_name {
  description = "reddit"
  default     = "reddit"
}

variable app_environment {
  description = "reddit"
  default     = "reddit"
}

variable zone {
  description = "Zone"
  default     = "europe-north1-a"
}

variable machine_type {
  description = "Type of virtual machine instance for app"
  default     = "g1-small"
}


variable private_key {
  description = "Path to the private key used for ssh access"
  default     = "appuser:MIIEogIBAAKCAQEAz/rcMpufleSEpnDF+Mz66A7Y/S4osC+4L/FqQUc+laUmKhIg8DqUhDn7bzKTXXjfObL4eHGUcYJxGaLgwPQL/T3R1Yq+SfsLSmpr2OvBnk3Sw8Di8sA935t0bKL1P+aWfnJr3YrpNMdKduIQsLTWb3NFrYwZLvnScJL1EVSgqVREVdUti0KUfa+1YEgEZ9iM930jWUmwUmWg0fpubVqT/DHcSUdWXSaJFNyencFJxNG12CsnwjV0Y1qlV7ugoRjVPcWaTk/4XQqRFLeeb0bwvnLohv1T+J24KFNo3P7pTdc+KjJVhd3kSGUPZ3r33HPPVLDXeNd/nwHX0fNgWodlRQIBIwKCAQBHTrHldy9ml33v7CaeciojrVG14/Cxb3JZlJl1d4Mr/hu2pyE8a9smBUBDYcwgDC9G+4hjzyuUocBgj52D++bae5hmeLZFQCEg1Ae4FlEDE140fKWVDrYgx5WhlvT/90mKcF9/KE/01p0wEv5oeIQI9FJnYzvVl3tZy/xAdMlen+3mTfwYRUvdSmoKHX8eLCBpWUJMHOLa45w6udyo+wNZvfyE/tBN4+uDpQXkcBXRDvddPdNb+BZOiS52dvwK3w+Au9a8Z1dWPV2NYt5vN2XTepsG98jKIs0Thm2Yyou0FbzFj4soeD8cIOaahcbECCJV5/D+rWkZSqIexmLyM3W7AoGBAPY5FvWfWjOw8zmxNvyVc3OZsoOG2thsNsz1Y35UsvhZSOWn62wg60mSrLplJ02l9DrMYTyNA//TniyJc7u2CL7x6Sseg/M8Uk5a639cG+mycP0pc8xc5b/B6fjNyhA17ft0ex4cIhR4l8VKeF6w0bXOzLTy3m46eKiSMCOql8LfAoGBANg9BW36c5jco3ERkFUPubrVMPPJxUI9Fvbb+Ncry3yH1CtyygquYntCOT2zqGcnxymRKu1o8zOAAbFKF4XLWtO/DeeKSUZlL/Hda8D5dB4N3FHejCijfSJCzAW8O2xKqdwgKeGJB8JobVQvpxVv37Vgqk5J1J7axNZmAJwYLuBbAoGBAKjWsKhtRSrCeuW7WOe28BTBKfPKL6pY1R7UJveKiVnW0uafB9Ud4ysiv5XBtI0EFS+iFspvUzMUxDvL95aotYo/e1DEd7y7picZxg4wiCs4h/4Ny79VpNtDJBhSmS+v86UcrDHnZ9OF5GoHLffJtF9pO+nLHC5T+vc/q/szJjx7AoGAaQeyLhqP6ylWs0MLlwejWr9SSoaTAup43k2WH15qJosd6TfBOGNUZ8EUfQ4emIEI9u69FDpKPZXyMYpjMlt1Qkba3i05iJeMUOfj4WM4Zl6A9JCqeiOF7BHQz5Xw+hWi9eO8kh38dF6bgKluaX97SXgYNKeEh6wWdsPUaRMPdEkCgYEA0VqsqxLFahHhexZXWDhsdlQr4wvSzziO2wQXnnK/9XL8z7oMbPTdV1k+9YmWAPfu/trIG0+cXJDY4a/GbG64XjgMLTgDQriVaoirGir26UIZ7clHJTseQlR+CBr765rtwY4ZGVMgN9pi0hL1KLQRh7qGOqssuvntAeTQ6Kl8Dyo="
}

variable reddit_db_ip {
  description = "Internal IP address of reddit-db instance"
  default     = "0.0.0.0"
}

variable provisioners_enabled {
  description = "Provisoners toggle"
  default     = "3"
}


variable app_disk_image {
  default = "projects/forward-karma-262407/global/images/reddit-base-1578467159"
}
