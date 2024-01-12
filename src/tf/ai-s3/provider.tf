terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
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

# Configure the AWS Provider
provider "aws" {
  region     = "gra"
  
  access_key = "b6d351bf652b4871a04fc25d94e2836a"
  secret_key = "bf80c42580e3487cb44a3a3923d1f136"

  # OVH implementation has no STS service
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  # the gra region is unknown to AWS hence skipping is needed.
  skip_region_validation = true
  endpoints {
    s3 = "https://s3.gra.io.cloud.ovh.net"
  }
}