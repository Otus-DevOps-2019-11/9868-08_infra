terraform {
  # Версия terraform
  required_version = "0.12.8"
}

provider "google" {
  # Версия провайдера
  version = "2.15"
  # ID проекта
  project = var.project
  region  = var.region
}

# create VPC
resource "google_compute_network" "vpc" {
  name                    = "reddit-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-north1-a"
  tags         = ["reddit-app"]
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
  ssh-keys = "appuser:${file(var.public_key_path)}\nappuser1:${file(var.public_key_path)}\nappuser_web:${file(var.public_key_path)}" }

  connection {
    type  = "ssh"
    host  = self.network_interface[0].access_config[0].nat_ip
    user  = "appuser"
    agent = false
    # путь до приватного ключа
    private_key = file("~/.ssh/appuser")
  }
  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

#resource "google_compute_firewall" "firewall_puma" {
#  name = "allow-puma-default"
#  # Название сети, в которой действует правило
#  network = "default"
#  # Какой доступ разрешить
#  allow {
#    protocol = "tcp"
#    ports    = ["9292"]
#  }
#  # Каким адресам разрешаем доступ
#  source_ranges = ["0.0.0.0/0"]
#  # Правило применимо для инстансов с перечисленными тэгами
#  target_tags = ["reddit-app"]
#}
