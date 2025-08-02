terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.6.0"
    }
  }
}

provider "github" {
}

data "github_repository" "current" {
  full_name = "FidelusAleksander/introduction-to-terraform"
}

output "repository" {
  value = data.github_repository.current
  
}


# resource "github_repository_ruleset" "protect_default_branch" {
#   name        = "Protect Default Branch"
#   repository  = data.github_repository.current.name
#   target      = "branch"
#   enforcement = "active"

#   conditions {
#     ref_name {
#       include = ["~DEFAULT_BRANCH"]
#       exclude = []
#     }
#   }

#   rules {
#     pull_request {
#       required_approving_review_count = 1
#       dismiss_stale_reviews_on_push   = true
#       require_code_owner_review       = false
#       require_last_push_approval      = false
#     }
#   }
# }

