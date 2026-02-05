terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.95.0"
    }
  }
  backend "s3" {
    bucket = "courseproject108"
    key    = "terraform.tfstate"
    use_lockfile = true
    region = "us-east-1"
  }

}

provider "aws" {
  # Configuration options
 region = "us-east-1"
}
