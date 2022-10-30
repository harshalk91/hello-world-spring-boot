terraform {
  required_providers {
    dockerhub = {
      source = "magenta-aps/dockerhub"
      version = "0.0.14"
    }
  }
}


provider "dockerhub" {
  username = var.dockerhub_username
  password = var.dockerhub_password
}


provider "aws" {
  region = "us-east-1"
}