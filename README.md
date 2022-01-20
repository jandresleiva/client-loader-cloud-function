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