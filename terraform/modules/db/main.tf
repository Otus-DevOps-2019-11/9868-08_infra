provider "google" {
  project = var.project
  region  = var.region
}


resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = var.machine_type
  zone         = "europe-west1-b"
  tags         = ["reddit-db"]
  boot_disk {
    initialize_params {
      image = var.db_disk_image
  }
}

provisioner "file" {
  source      = "${path.module}/files/mongod.conf"
  destination = "/tmp/mongod.conf"
}
provisioner "remote-exec" {
  script = "${path.module}/files/mongo_conf.sh"
}
connection {
  type        = "ssh"
  host        = google_compute_instance.db.network_interface.0.access_config.0.nat_ip
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



resource "google_compute_firewall" "firewall-mongo" {
  name = "allow-mongo-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  source_ranges = ["0.0.0.0/0"]

 # правило применимо к инстансам с тегом ...
  target_tags = ["reddit-db"]

  # порт будет доступен только для инстансов с тегом ...
#  source_tags = ["reddit-app"]
}

