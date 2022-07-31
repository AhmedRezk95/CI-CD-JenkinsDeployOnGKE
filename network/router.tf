resource "google_compute_router" "router" {
  name    = "my-router"
  region  = google_compute_subnetwork.management-subnet.region
  network = google_compute_network.vpc_network.id
  bgp {
    asn = 64514
  }
}


# additional to make jenkins go only WILL DELETE LATER
resource "google_compute_router" "router_gke" {
  name    = "my-router-gke"
  region  = google_compute_subnetwork.restricted-subnet.region
  network = google_compute_network.vpc_network.id
  bgp {
    asn = 64514
  }
}

