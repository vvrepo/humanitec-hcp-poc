terraform {
  required_providers {
    humanitec = {
      source  = "humanitec/humanitec"
    }
  }
  required_version = ">= 1.3.0"
}

provider "humanitec" {
   org_id = var.humanitec_organization
}

