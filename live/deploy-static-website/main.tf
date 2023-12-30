module "static_website" {
  source             = "github.com/fixer-coder/terraform-projects//modules/aws/data-storages/s3/public-bucket?ref=adc92e920f9e066c19a3f50b05c130c22b1367f0"
  name               = "terraform-backend-projects-work-tester"
  force_destroy      = true
  error_document_key = "error/error.html"
  tags = {
    "environment" : "dev"
    "team" : "DevOps"
  }
}
