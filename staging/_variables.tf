variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_STAGING"
}

variable "env_name" {
  type    = string
  default = "STAGING"
}

variable "snowflake_oauth_access_token" {
  type        = string
  description = "OAuth access token (e.g., Snowflake PAT) used to access Snowflake"
  sensitive   = true
}