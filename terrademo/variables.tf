variable "project" {
  description = "Project"
  default     = "module-3-project-ethan"
}

variable region {
    description = "Region"
    default = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}


variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "module-3-project-ethan-terra-bucket"
}


variable "gcs_storage_class" {
  description = "Bucket Strorage Class"
  default     = "STANDARD"
}

variable "bq_dataset_name_nytaxi" {
  description = "BigQuery Dataset for dbt module"
  default     = "nytaxi"
}
