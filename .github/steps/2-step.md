## Step 2: Adding Branch Protection Rules

Now that you've successfully managed a simple repository label, your team wants to implement branch protection rules to ensure code quality and security. Instead of manually configuring these in the GitHub interface, you'll add a new resource to your Terraform configuration to automate this critical security practice.

### 📖 Theory: Branch Protection with Infrastructure as Code

Branch protection rules are essential for maintaining code quality and security in collaborative development. These rules can require pull requests, status checks, and restrict who can push to protected branches. By managing these rules through Terraform, you ensure consistent protection policies across all repositories and can version control changes to security policies.

- Branch protection rules enforce policies like requiring pull requests and status checks
- Terraform resources are declarative - you describe the desired end state
- Adding resources to existing configurations follows the same init, plan, apply workflow
- Each resource type has specific arguments that control its behavior

Learn more about [GitHub branch protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches) and the [Terraform branch protection resource](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection).

### ⌨️ Activity: Add Branch Protection Configuration

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

<details>
<summary>Having trouble? 🤷</summary><br/>

- Add the branch protection resource to the end of your `main.tf` file, after the existing resources
- Make sure the indentation matches the other resources in your file
- If `terraform plan` shows errors, check that all braces and quotes are properly matched
- Verify the protection rule in your repository by going to Settings > Branches
- If the rule doesn't appear, check the terminal output for any error messages

</details>
