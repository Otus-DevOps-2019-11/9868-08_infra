#output "db_external_ip" {
# value = "${google_compute_instance.db.network_interface.0.access_config.0.nat_ip}"
#  value = "${element(concat(google_compute_instance.db.network_interface.0.access_config.0.nat_ip, list("")), 0)}"
#}

output "db_external_ip" {
  value = google_compute_instance.db.network_interface.0.access_config.0.nat_ip
}


