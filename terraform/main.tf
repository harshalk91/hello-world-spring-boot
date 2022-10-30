resource "dockerhub_repository" "dokerhub_repo" {
  name             = "hello-world-spring-boot"
  namespace        = "harshalk91"
  description      = "hello-world-spring-boot"
  full_description = "Readme."
}

resource "dockerhub_token" "master_token" {
  label = "master_token"
  scopes = ["repo:admin"]
}
