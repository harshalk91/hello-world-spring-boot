terraform {
  backend "s3" {
    bucket         = "tfstates-devops"
    key            = "hello-world-sping-boot/dockerhub_repo.tf"
    region         = "us-east-1"
  }
}