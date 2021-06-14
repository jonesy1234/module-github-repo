terraform {
  required_version = ">= 0.12"
}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.3.0"
    }
  }
}
