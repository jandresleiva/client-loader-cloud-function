# 02-main.tf

# Creds setup
provider "google" {
    credentials = "${file("service-account.json")}"
    project = var.project
    region = var.region
}

# Bucket and src load

resource "google_storage_bucket" "bucket" {
  name = "clients-database-bucket" # This bucket name must be unique
  location = var.region
}

data "archive_file" "src" {
  type        = "zip"
  source_dir  = "${path.root}/../src" # Directory where your Python source code is
  output_path = "${path.root}/../generated/src.zip"
}

resource "google_storage_bucket_object" "archive" {
  name   = "${data.archive_file.src.output_md5}.zip"
  bucket = google_storage_bucket.bucket.name
  source = "${path.root}/../generated/src.zip"
}