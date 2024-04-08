resource "aws_s3_bucket" "data_source" {
  bucket = "${var.data_source_name}-${random_id.random.hex}"
}

resource "random_id" "random" {
  byte_length = 8
}

resource "aws_s3_object" "pnl" {
  bucket = aws_s3_bucket.data_source.bucket
  key = "pnl.csv"
  source = var.pnl_path
}

resource "aws_s3_object" "positions" {
  bucket = aws_s3_bucket.data_source.bucket
  key = "positions.csv"
  source = var.positions_path
}

resource "aws_s3_object" "securities" {
  bucket = aws_s3_bucket.data_source.bucket
  key = "securities.csv"
  source = var.securities_path
}