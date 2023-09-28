terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
    }

    ovh = {
      source  = "ovh/ovh"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3"
  region      = "GRA"
}