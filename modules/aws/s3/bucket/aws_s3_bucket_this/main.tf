resource "aws_s3_bucket" "this" {
  bucket = var.bucket
  tags = merge(
    {
      Name = var.bucket
    },
    var.tags
  )
}
