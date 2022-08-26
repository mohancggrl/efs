variable "subnets" {
  default     = [data.aws_subnet.jmjs_int1.id, data.aws_subnet.jmjs_int1.id]
  description = "Subnet IDs that the EFS mount points should be created on (required if `create==true`)"
  type        = list(string)
}

variable "access_key" {
  description = "AWS ACCESS_KEY"
  default     = "access_key"
}

variable "secret_key" {
  description = "AWS SECRET_KEY"
  default     = "secret_key"
}

variable "efs_kms_key_id" {
  default     = null
  description = "ARN of KMS key to use for EFS encryption (leave null to create a key, set to `aws/backup` to use AWS default CMK)"
  type        = string
}

variable "create" {
  default     = true
  description = "If `false`, this module does nothing"
  type        = bool
}

variable "performance_mode" {
  default     = "generalPurpose"
  description = "Performance mode to run in (`generalPurpose` or `maxIO`)"
  type        = string
}

variable "throughput_mode" {
  default     = "bursting"
  description = "EFS file system throughput mode (`provisioned` or `bursting`)"
  type        = string
}

variable "provisioned_throughput" {
  default     = null
  description = "Provisioned throughput (in mbps)"
  type        = number
}

variable "additional_tags" {
  default     = {
    Name = "efs_jm"
	env = "svp"
  }
  description = "User-Defined tags"
  type        = map(string)
}