{% set valid_tool = tf_tool if tf_tool in ["terraform", "opentofu"] else "terraform" %}
{% set tool_display = "OpenTofu" if valid_tool == "opentofu" else "Terraform" %}
{% set tool_cmd = "tofu" if valid_tool == "opentofu" else "terraform" %}

## Step 2: Adding Branch Protection Rules

Now that you've successfully managed a simple repository label, your team wants to implement branch protection rules to ensure code quality and security. Instead of manually configuring these in the GitHub interface, you'll add a new resource to your {{ tool_display }} configuration to automate this critical security practice.

### 📖 Theory: Branch Protection with Infrastructure as Code

Branch protection rules are essential for maintaining code quality and security in collaborative development. These rules can require pull requests, status checks, and restrict who can push to protected branches. By managing these rules through {{ tool_display }}, you ensure consistent protection policies across all repositories and can version control changes to security policies.

- Branch protection rules enforce policies like requiring pull requests and status checks
- {{ tool_display }} resources are declarative - you describe the desired end state
- Adding resources to existing configurations follows the same init, plan, apply workflow
- Each resource type has specific arguments that control its behavior

{% if valid_tool == "opentofu" %}
Learn more about [GitHub branch protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches) and the [OpenTofu branch protection resource](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection).
{% else %}
Learn more about [GitHub branch protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches) and the [Terraform branch protection resource](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection).
{% endif %}

### ⌨️ Activity: Add Branch Protection Configuration

1. Add a `github_branch_protection` resource to your `main.tf` file

```hcl
resource "github_branch_protection" "protect_main" {
  repository_id = data.github_repository.this.node_id
  pattern       = "main"

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}
```

1. Configure protection for the main branch with required pull requests
1. Run `{{ tool_cmd }} plan` to see the new resource that will be created
1. Run `{{ tool_cmd }} apply`. Notice the permission error.
1. Run this command
1. Verify the protection rule appears in your repository settings

<details>
<summary>Having trouble? 🤷</summary><br/>

- Add the branch protection resource to the end of your `main.tf` file, after the existing resources
- Make sure the indentation matches the other resources in your file
- If `{{ tool_cmd }} plan` shows errors, check that all braces and quotes are properly matched
- Verify the protection rule in your repository by going to Settings > Branches
- If the rule doesn't appear, check the terminal output for any error messages

</details>
