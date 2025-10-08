variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_PROD"
}

variable "env_name" {
  type    = string
  default = "PROD"
}

variable "snowflake_oauth_access_token" {
  type        = string
  description = "OAuth access token (e.g., Snowflake PAT) used to access Snowflake"
  sensitive   = true
}