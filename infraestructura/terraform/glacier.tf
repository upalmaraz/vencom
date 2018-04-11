resource "aws_s3_bucket" "s3_vencom_glacier" {
  bucket = "vencom-glacier"
  acl    = "private"

  lifecycle_rule {
    id      = "vencom-glacier"
    enabled = true

    prefix = "vencom-glacier/"

    tags {
      "rule"      = "vencom-glacier"
      "autoclean" = "true"
    }

    #   transition {
    #     days          = 30
    #     storage_class = "STANDARD_IA"
    #   }

    transition {
      days          = 30
      storage_class = "GLACIER"
    }
  }
}
