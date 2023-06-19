resource "local_sensitive_file" "loc-sens-file" {
  source    = var.source_sens_file
  filename  = var.filename
}