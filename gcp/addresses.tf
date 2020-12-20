resource "google_compute_address" "bench" {
    name = "${var.name}-bench-0"
    region = var.region
    count = 1
}

resource "google_compute_address" "competitor" {
    name = "${var.name}-competitor-${count.index}"
    region = var.region
    count = var.node_count
}

