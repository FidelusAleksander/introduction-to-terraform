terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.6.0"
    }
  }
}

provider "github" {}



resource "github_issue_label" "test_repo" {
  repository = var.repository_name
  name       = "urgent"
  color      = "FF0000"
  description = "This is an urgent issue that needs immediate attention."
}


variable "repository_name" {
  description = "The name of the GitHub repository"
  type        = string
  default     = "introduction-to-terraform"
}