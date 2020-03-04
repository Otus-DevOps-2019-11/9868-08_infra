provider "google" {
  project = var.project
  region  = var.region
}


resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = var.machine_type
  zone         = "europe-west1-b"
  tags         = ["reddit-db"]
  boot_disk {
    initialize_params {
      image = var.app_disk_image
  }
}

provisioner "file" {
  content     = file("/9868-08_infra/terraform/modules/app/files/puma.service.tpl")
  destination = "/tmp/puma.service"
}
provisioner "remote-exec" {
  script = "/9868-08_infra/terraform/modules/app/files/deploy.sh"
}
connection {
  type        = "ssh"
  host        = google_compute_instance.app.network_interface.0.access_config.0.nat_ip
  user        = "appuser"
  agent       = "false"
  private_key = file(var.private_key_path)
}

network_interface {
  network = "default"
  access_config {}
    // Ephemeral IP
  }
  metadata = {
    ssh-keys = file(var.public_key_path)
  }
}

data "template_file" "puma-service-conf" {
  template = "/9868-08_infra/terraform/modules/app/files/puma.service.tpl"
  #  vars {
  #    reddit_db_ip = "0.0.0.0"
  #  }
}

resource "google_compute_firewall" "firewall-puma" {
  name    = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}


