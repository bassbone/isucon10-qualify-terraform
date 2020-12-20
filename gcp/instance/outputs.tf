output "network_interface" {
    value = google_compute_instance.default.*.network_interface
}

