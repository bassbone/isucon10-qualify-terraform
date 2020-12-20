variable "name" {}

variable "tags" {}

variable "network_name" {}

variable "subnetwork_name" {}

variable "static_ip" {}

variable "ipv4_prefix" {}

variable "zone" {}

variable "ipv4_offset" {
    default = 101
}

variable "machine_type" {
    default = "custom-1-2048"
}

variable "disk_image" {
    default = "ubuntu-1804-bionic-v20200701"
}

variable "disk_size" {
    default = 15
}

variable "node_count" {
    default = 1
}

variable "metadata_startup_script" {
    default = ""
}

variable "preemptible" {
    default = false
}

