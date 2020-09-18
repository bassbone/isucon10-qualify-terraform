resource "google_compute_subnetwork" "default" {
    name          = "${var.name}-subnet"
    ip_cidr_range = "${var.ipv4_prefix}.0/24"
    region        = var.region
    network       = google_compute_network.default.id
}

