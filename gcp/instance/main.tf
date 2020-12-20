resource "google_compute_instance" "default" {
    count = var.node_count
    name = "${var.name}-${count.index}"
    machine_type = var.machine_type
    boot_disk {
        initialize_params {
            size  = var.disk_size
            type  = "pd-ssd"
            image = var.disk_image
        }
    }
    zone = var.zone
    tags = [var.tags]
    network_interface {
        network = var.network_name
        subnetwork = var.subnetwork_name
        network_ip = "${var.ipv4_prefix}.${var.ipv4_offset + count.index}"
        access_config {
            nat_ip = var.static_ip[count.index].address
        }
    }
    allow_stopping_for_update = true
    scheduling {
        preemptible = var.preemptible
        automatic_restart = false
    }
    metadata_startup_script = var.metadata_startup_script
}
