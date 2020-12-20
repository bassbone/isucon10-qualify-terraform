output "bench_address" {
    value = module.gce_bench.network_interface.*.0.access_config.0.nat_ip
}

output "competitor_address" {
    value = module.gce_competitor.network_interface.*.0.access_config.0.nat_ip
}

