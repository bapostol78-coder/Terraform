output "bucket_name" {
  description = "Name of the data bucket"
  value       = aws_s3_bucket.data.bucket
}

output "versioning_enabled" {
  value = length(aws_s3_bucket_versioning.data) > 0
}

output "tags_applied" {
  value = aws_s3_bucket.data.tags_all
}
