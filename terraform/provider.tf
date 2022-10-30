terraform {
  required_providers {
    dockerhub = {
      source = "BarnabyShearer/dockerhub"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "dockerhub" {
  username = var.dockerhub_username
  password = var.dockerhub_username
}


provider "aws" {
  region = "us-east-1"
}