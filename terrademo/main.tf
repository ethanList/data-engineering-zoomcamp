terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  #credentials being auto picked up 
  project = "terraform-demo-499022"
  region  = "us-central1"
}



resource "google_storage_bucket" "demo-bucket" {
  name          = "terraform-demo-499022-terra-bucket"
  location      = "US"
  uniform_bucket_level_access = true
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}