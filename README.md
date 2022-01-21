# Installation

## Add your account service credentials.
You will need to add an account service credentials for GCP.
You can download it as a JSON file from the IAM module within GCP page. It will look something like:
Store it within `terraform/service-account.json`

## Apply terraform
This will create the GCP Function, a bucket to store the function source code, and a IAM service account to invoke the function.

```
cd terraform
terraform init
terraform plan
terraform apply
```

# Terraform Structure

`01-variables.tf`
Has the definitions for region and project name

`02-main.tf` 
Has the creation of the bucket and upload of the source code

`03-function.tf` 
Has the creation of the function and IAM service account to invoke it.

# goProcessor
This branch is meant to develop a proper solution to the reception of the actual data, its interpretation and storage on a documental DB.

It's required for the solution to support multiple data formats, recognizable by the structure of the header (first line) or some argument sent from the client.

It's still to be defined if we're goint to use some kind of stream or just chunks of the original file and send them independently. It must be considered, the upload files may be `2 MB < file < 60 Mb`

This branch should not be concerned with the actual storage of the data or the communication with the client, but only it's interpretation and formatting.