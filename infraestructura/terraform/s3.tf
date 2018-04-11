resource "aws_s3_bucket" "s3_vencom" {
  bucket = "vencom"
  acl    = "private"

  lifecycle_rule {
    id      = "vencom"
    enabled = true

    prefix = "vencom/"

    tags {
      "rule"      = "vencom"
      "autoclean" = "true"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }
}

resource "aws_s3_bucket" "s3_vencom_backup" {
  bucket = "vencom-backup"
  acl    = "private"

  lifecycle_rule {
    id      = "vencom-backup"
    enabled = true

    prefix = "vencom-backup/"

    tags {
      "rule"      = "vencom-backup"
      "autoclean" = "true"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }
}
