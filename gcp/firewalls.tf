resource "google_compute_firewall" "ssh" {
    name = "${var.name}-ssh"
    network = google_compute_network.default.name
    allow {
        protocol = "tcp"
        ports = ["22"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["${var.name}-bench", "${var.name}-competitor"]
}

resource "google_compute_firewall" "http" {
    name = "${var.name}-http"
    network = google_compute_network.default.name
    allow {
        protocol = "tcp"
        ports = ["80"]
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["${var.name}-competitor"]
}

resource "google_compute_firewall" "internal" {
    name = "${var.name}-internal"
    network = google_compute_network.default.name
    allow {
        protocol = "tcp"
        ports = ["0-65535"]
    }
    source_ranges = ["${var.ipv4_prefix}.0/16"]
    target_tags = ["${var.name}-competitor"]
}

