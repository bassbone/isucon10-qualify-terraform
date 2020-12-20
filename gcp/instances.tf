module "gce_competitor" {
    source = "./instance"
    name = "${var.name}-competitor"
    tags = "${var.name}-competitor"
    zone = var.zone
    network_name = google_compute_network.default.name
    subnetwork_name = google_compute_subnetwork.default.name
    metadata_startup_script = file("./startup-script/competitor.sh")
    node_count = var.node_count
    static_ip = google_compute_address.competitor
    ipv4_prefix = var.ipv4_prefix
    ipv4_offset = 100
    preemptible = var.preemptible
}

module "gce_bench" {
    source = "./instance"
    name = "${var.name}-bench"
    tags = "${var.name}-bench"
    zone = var.zone
    network_name = google_compute_network.default.name
    subnetwork_name = google_compute_subnetwork.default.name
    metadata_startup_script = file("./startup-script/bench.sh")
    static_ip = google_compute_address.bench
    ipv4_prefix = var.ipv4_prefix
    ipv4_offset = 200
    preemptible = var.preemptible
}

