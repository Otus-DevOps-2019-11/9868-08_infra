variable zone {
  description = "Zone"
  default     = "europe-north1-a"
}


variable machine_type {
  description = "Type of virtual machine instance for db"
  default     = "g1-small"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
  default = "/home/dinky/.ssh/appuser.pub"
}

variable private_key_path {
  description = "Path to the private key used for ssh access. Used by travis only"
  default     = "/home/dinky/.ssh/appuser"
}


variable db_disk_image {
  description = "Disk image for reddit DB"
  default = "projects/infra-986808/global/images/reddit-base-1578651793"
}

variable provisioners_enabled {
  description = "Provisoners toggle"
  default     = "3"
}

variable project {
  description = "infra-986808"
  default     = "infra-986808"
}

# значение по умолчанию региона
variable region {
  description = "Значение по умолчанию Region"
  default     = "europe-west1"
}

