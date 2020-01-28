resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "var.machine_type"
  zone = "europe-west1-b"
  tags = ["reddit-db"]
  boot_disk {
    initialize_params {
      image = "var.app_disk_image"
    }
}

network_interface {
   network = "default"
   access_config {
      nat_ip = "google_compute_address.app_ip.address"
    }
  }
  metadata = {
    ssh-keys = file(var.public_key_path)
}

resource "null_resource" "app" {
  count = var.provisioners_enabled

  connection {
    type        = "ssh"
    host        = "google_compute_instance.app.network_interface.0.access_config.0.nat_ip"
    user        = "appuser"
    agent       = "false"
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    content     = "data.template_file.puma-service-conf.rendered"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "path.module/files/deploy.sh"
  }
}

data "template_file" "puma-service-conf" {
  template = "/9868-08_infra/terraform/modules/app/files/puma.service.tpl"
#  vars {
#    reddit_db_ip = "0.0.0.0"
#  }
}

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_firewall" "firewall-puma" {
  name = "allow-puma-default"

  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
