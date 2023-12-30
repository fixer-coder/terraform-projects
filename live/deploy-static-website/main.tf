module "static_website" {
  source             = "../../modules/aws/data-storages/s3/public-bucket"
  name               = "terraform-backend-projects-work-tester"
  force_destroy      = true
  error_document_key = "error/error.html"
  tags = {
    "environment" : "dev"
    "team" : "DevOps"
  }
}
