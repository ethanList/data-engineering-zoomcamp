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
  project = var.project
  region  = var.region
}



resource "google_storage_bucket" "demo-bucket" {
  name                        = var.gcs_bucket_name
  location                    = var.location
  uniform_bucket_level_access = true
  force_destroy               = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}



resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = var.bq_dataset_name
  location = var.location

} 

resource "google_bigquery_dataset" "nytaxi_dataset" {
  dataset_id = var.bq_dataset_name_nytaxi
  location   = var.location
}