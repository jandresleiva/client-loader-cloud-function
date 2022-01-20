# 03-function.tf

# Creates Function
resource "google_cloudfunctions_function" "function" {
  name        = "clients-database-function"
  description = "This will parse csv files and store them in a documental storage."
  runtime     = "go116"

  environment_variables = {
    FOO = "bar",
  }

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "clientsDatabase" # This is the name of the function that will be executed in your Python code
}

# Service Account for Function

resource "google_service_account" "service_account" {
  account_id   = "clients-database-invoker"
  display_name = "Clients Database CSV parser and Store Invoker Service Account"
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "serviceAccount:${google_service_account.service_account.email}"
}