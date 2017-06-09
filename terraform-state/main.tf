# Create resource in EU west

resource "aws_s3_bucket" "terraform_bucket_logging" {
  count  = "${length(var.buckets)}"
  bucket = "${element(var.buckets, count.index)}-log"
  acl    = "log-delivery-write"
  tags {
    Name = "${element(var.buckets, count.index)}"
  }
}

resource "aws_s3_bucket" "terraform_bucket" {
  count  = "${length(var.buckets)}"
  bucket = "${element(var.buckets, count.index)}"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags {
    Name = "${element(var.buckets, count.index)}"
  }
  logging {
    target_bucket = "${element(aws_s3_bucket.terraform_bucket_logging.*.id, count.index)}"
    target_prefix = "log/"
  }
}

resource "aws_dynamodb_table" "terraform_tables" {
  count          = "${length(var.tables)}"
  name           = "${element(var.tables, count.index)}"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
