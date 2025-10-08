terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.63.0"
    }
  }

  backend "s3" {
    bucket = "brl-terraformstate-bucket"
    key    = "terraform-staging.tfstate"
    region = "us-east-1"
    # Optional DynamoDB for state locking. See https://developer.hashicorp.com/terraform/language/settings/backends/s3 for details.
    # dynamodb_table = "terraform-state-lock-table"
    encrypt = true
  }
}

provider "snowflake" {
  username    = "cicduser"
  account     = "xr96327.us-east-1"
  role        = "SNOWFLAKE_LEARNING_ROLE"
  private_key = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 1
  database            = var.database
  env_name            = var.env_name
}