##### Mandatory #####
variable "bucket_name" {
  description = "Name of the Bucket - needs to be uniq"
  type        = string
}

variable "log_bucket_id" {
  description = "Name of the Bucket where all logs should be shipped to"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of the KMS Key, use aws_kms_key.mykms.target_key_id"
  type        = string
}





##### Optional #####

variable "metrics_enabled" {
  description = "Enable full Metrics Collection on the Bucket"
  default     = true
  type        = bool
}

variable "versioning_enabled" {
  description = "Enable Versioning on the Bucket"
  default     = true
  type        = bool
}

variable "Environment" {
  description = "Name of the Environment - just used for tagging"
  default     = "dev"
  type        = string
}