---
name: GitHub Skills Exercise
about: Template for creating a new GitHub Skills exercise
title: "Introduction to Terraform"
labels: "skills"
assignees: ""
---

# Logistics

<!-- Important Context, critical dates, related releases, other special notes, etc. -->

- **Exercise Title:** Introduction to Terraform
- **Repo URL:** https://github.com/FidelusAleksander/introduction-to-terraform
- **Experience Level**: Beginner
- **Recommended Grouping**: Infrastructure as Code

### Relationships to other exercises

- **Previous Exercise:** None

---

# Outline

## Story Plot

You're a DevOps engineer tasked with standardizing your team's repository management practices. Manual configuration of repository settings across multiple projects has become error-prone and time-consuming. Your team wants to adopt Infrastructure as Code (IaC) practices to automate and version control repository configurations, ensuring consistency and compliance across all projects.

## README

**Title:** Introduction to Terraform

Learn the fundamentals of Terraform by managing GitHub repository settings as Infrastructure as Code. You'll create your first Terraform configuration using the GitHub provider to automate repository management tasks like labels, branch protection, and resource imports.

### Overview

1. Introduction to Terraform workflow by adding a repository label
1. Create branch protection rules using Terraform
1. Attempt to add repository configuration and encounter existing resource conflicts
1. Learn to import existing GitHub resources into Terraform state

### What you will build

You'll work with a pre-configured Terraform setup to gradually learn Infrastructure as Code concepts. Starting with adding a simple repository label, you'll progress to creating branch protection rules and finally learn how to import existing GitHub resources into Terraform management.

### Prerequisites

- Basic understanding of Git and GitHub
- Familiarity with command-line interfaces
- No prior Terraform knowledge required

## Step 1 - Your First Terraform Workflow

### Story

Your team has set up a basic Terraform configuration to manage repository labels. This is your first hands-on experience with Infrastructure as Code - you'll run the standard Terraform workflow commands to see how code becomes infrastructure. The configuration is already prepared, so you can focus on understanding the process.

### Theory

The Terraform workflow follows a predictable pattern: initialize, plan, and apply. This three-step process ensures safe infrastructure changes by first downloading required providers, then showing you what will change, and finally executing those changes. You'll start with a simple repository label to understand this fundamental workflow.

- `terraform init` downloads providers and prepares your workspace
- `terraform plan` shows you what changes Terraform will make
- `terraform apply` executes the planned changes to create or modify infrastructure
- Terraform manages state to track what resources it controls

### References

- https://developer.hashicorp.com/terraform/tutorials/cli/init
- https://developer.hashicorp.com/terraform/tutorials/cli/plan
- https://developer.hashicorp.com/terraform/tutorials/cli/apply
- https://registry.terraform.io/providers/integrations/github/latest/docs
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label

### Activity: Startup Development Environment

1. Start your codespace and explore the workspace
1. Examine the pre-configured `main.tf` file structure
1. Review the Terraform configuration syntax and understand what each section does
1. Familiarize yourself with the GitHub provider and issue label resource

### Activity: Run Your First Terraform Workflow

1. Run `terraform init` to initialize the configuration
1. Run `terraform plan` to see what will be created
1. Run `terraform apply` to create the repository label
1. Verify the label was created in your repository

### Transition

- **Actions Trigger:** [`label`](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#label)
- **Grading-Check:** Verify a specific label exists on the repository using [action-keyphrase-checker](https://github.com/skills/action-keyphrase-checker)

## Step 2 - Adding Branch Protection Rules

### Story

Now that you've successfully managed a simple repository label, your team wants to implement branch protection rules to ensure code quality and security. Instead of manually configuring these in the GitHub interface, you'll add a new resource to your Terraform configuration to automate this critical security practice.

### Theory

Branch protection rules are essential for maintaining code quality and security in collaborative development. These rules can require pull requests, status checks, and restrict who can push to protected branches. By managing these rules through Terraform, you ensure consistent protection policies across all repositories and can version control changes to security policies.

- Branch protection rules enforce policies like requiring pull requests and status checks
- Terraform resources are declarative - you describe the desired end state
- Adding resources to existing configurations follows the same init, plan, apply workflow
- Each resource type has specific arguments that control its behavior

### References

- https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection

### Activity: Add Branch Protection Configuration

1. Add a `github_branch_protection` resource to your `main.tf` file
1. Configure protection for the main branch with required pull requests
1. Run `terraform plan` to see the new resource that will be created
1. Run `terraform apply` to create the branch protection rule
1. Verify the protection rule appears in your repository settings

Use this configuration for the branch protection:

```hcl
resource "github_branch_protection" "main" {
  repository_id = var.repository_name
  pattern       = "main"

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}
```

### Transition

- **Actions Trigger:** [`branch_protection_rule`](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#branch_protection_rule)
- **Grading-Check:** Verify branch protection rule exists using [action-keyphrase-checker](https://github.com/skills/action-keyphrase-checker)

## Step 3 - When Resources Already Exist

### Story

Your team wants to add the repository itself to your Terraform configuration to manage its settings like description, visibility, and features. You'll add a repository resource and try to create it, but you'll discover that Terraform can't create something that already exists. This leads to an important concept in Infrastructure as Code - importing existing resources.

### Theory

When adopting Infrastructure as Code for existing systems, you'll often encounter resources that already exist. Terraform expects to create and manage resources from scratch, so attempting to create an existing resource results in an error. This is where you learn about Terraform's import functionality, which allows you to bring existing infrastructure under Terraform management.

- Terraform assumes it will create all resources defined in your configuration
- Attempting to create existing resources results in conflicts and errors
- This scenario commonly occurs when transitioning existing infrastructure to IaC
- Understanding these errors helps you recognize when import is needed

### References

- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
- https://developer.hashicorp.com/terraform/language/import

### Activity: Add Repository Configuration and Encounter the Conflict

1. Add a `github_repository` resource to your configuration matching this repository
1. Run `terraform plan` to see what Terraform wants to create
1. Run `terraform apply` and observe the error when trying to create an existing repository
1. Push your configuration changes to a new branch called "introduction-to-terraform"
1. Understand why the error occurred and what it means for managing existing infrastructure

Add this repository configuration to your `main.tf`:

```hcl
resource "github_repository" "repo" {
  name        = "introduction-to-terraform"
  description = "Learning Terraform with GitHub provider"
  visibility  = "public"
}
```

### Transition

- **Actions Trigger:** [`push`](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#push) (to "introduction-to-terraform" branch)
- **Grading-Check:** Verify push to "introduction-to-terraform" branch with `github_repository` resource using [action-keyphrase-checker](https://github.com/skills/action-keyphrase-checker)

## Step 4 - Importing Existing Infrastructure

### Story

You've encountered the classic Infrastructure as Code scenario - trying to manage existing resources with Terraform. The error message showed that the repository already exists and can't be created again. Now you'll learn how to solve this using Terraform's import functionality, bringing the existing repository under Terraform management without recreating it.

### Theory

Terraform import is the solution for managing existing infrastructure. Instead of creating new resources, import tells Terraform about resources that already exist. You add an import block to your configuration, run Terraform commands, and the existing resource becomes managed by Terraform without any changes to the actual infrastructure.

- Import blocks declare existing resources that should be brought under Terraform management
- The import process maps real-world resources to your Terraform configuration
- After import, Terraform can manage changes to the resource going forward
- Import is safe - it doesn't modify the existing resource, only Terraform's knowledge of it

### References

- https://developer.hashicorp.com/terraform/language/import
- https://developer.hashicorp.com/terraform/cli/import

### Activity: Import the Repository Resource

1. Add an import block to your configuration to import the existing repository
1. Run `terraform plan` to verify the configuration matches the existing state
1. Run `terraform apply` to complete the import process
1. Confirm Terraform now manages the repository without making changes
1. Push your updated configuration to the "introduction-to-terraform" branch

Add this import block to your `main.tf`:

```hcl
import {
  to = github_repository.repo
  id = "introduction-to-terraform"
}
```

### Transition

- **Actions Trigger:** [`push`](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#push) (to "introduction-to-terraform" branch)
- **Grading-Check:** Verify `main.tf` contains an import block and successful import with [action-keyphrase-checker](https://github.com/skills/action-keyphrase-checker)

## Review

You've successfully learned the fundamentals of Infrastructure as Code using Terraform with the GitHub provider. You experienced the core Terraform workflow, added new resources to existing configurations, encountered the common challenge of existing resources, and learned how to import existing infrastructure. These skills form the foundation for managing any infrastructure through code.

- Understanding the Terraform workflow: init, plan, apply
- Adding new resources to expand infrastructure management
- Recognizing and handling existing resource conflicts
- Importing existing resources into Terraform management
- Managing GitHub repository settings as code

### What's next?

- https://learn.hashicorp.com/terraform
- https://registry.terraform.io/providers/integrations/github/latest/docs
- https://skills.github.com

## Future Considerations

- Advanced Terraform features like modules and workspaces
- Managing multiple repositories and organization-level settings
- Integrating Terraform into CI/CD pipelines for automated infrastructure updates
- Exploring other Terraform providers for comprehensive infrastructure management
