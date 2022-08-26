variable "subnets" {
  default     = [" "]
  description = "Subnet IDs that the EFS mount points should be created on (required if `create==true`)"
  type        = list(string)
}

variable "efs_kms_key_id" {
  default     = ""
  description = "ARN of KMS key to use for EFS encryption (leave null to create a key, set to `aws/backup` to use AWS default CMK)"
  type        = string
}

variable "create" {
  default     = ""
  description = "If `false`, this module does nothing"
  type        = bool
}

variable "performance_mode" {
  default     = ""
  description = "Performance mode to run in (`generalPurpose` or `maxIO`)"
  type        = string
}

variable "throughput_mode" {
  default     = ""
  description = "EFS file system throughput mode (`provisioned` or `bursting`)"
  type        = string
}

variable "provisioned_throughput" {
  default     = ""
  description = "Provisioned throughput (in mbps)"
  type        = number
}

variable "additional_tags" {
  default     = ""
  description = "User-Defined tags"
  type        = map(string)
}