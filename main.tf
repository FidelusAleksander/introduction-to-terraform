terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.6.0"
    }
  }
}

provider "github" {}

data "github_repository" "this" {
  full_name = var.repository_full_name
}

resource "github_issue_label" "urgent" {
  repository = data.github_repository.this.name
  name       = "urgent"
  color      = "FF0000"
  description = "This is an urgent issue that needs immediate attention."
}


variable "repository_full_name" {
  description = "The name of this GitHub repository"
  type        = string
}

