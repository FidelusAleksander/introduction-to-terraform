{% set valid_tool = tf_tool if tf_tool in ["terraform", "opentofu"] else "terraform" %}
{% set tool_display = "OpenTofu" if valid_tool == "opentofu" else "Terraform" %}
{% set tool_cmd = "tofu" if valid_tool == "opentofu" else "terraform" %}

## Step 2: {{ tool_display }} providers

### 📖 Theory: What are {{ tool_display }} Providers?

**How Providers Work:**

Providers act as a bridge between {{ tool_display }} and external APIs like GitHub, AWS, Google Cloud, and many others. They handle the complexity of different API formats so you can use a consistent configuration language.

**Key Benefits:**

- **Resource Management** - Define infrastructure using resource types like `github_issue_label` or `github_branch_protection`
- **State Tracking** - Monitor infrastructure changes and detect drift from your desired configuration
- **Automatic Installation** - Downloaded during `{{ tool_cmd }} init` from the {{ tool_display }} Registry

**🔐 GitHub Provider Authentication:**

There are [multiple ways](https://registry.terraform.io/providers/integrations/github/latest/docs#authentication) to allow the GitHub provider to authenticate with GitHub API.

In the first step you've implicitly used the `GITHUB_TOKEN` environment variable that is readily available in your Codespace environment.

The default Codespace `GITHUB_TOKEN` has very limited permissions. For infrastructure management, you will likely need a token with broader permissions. 



### ⌨️ Activity: Add Branch Protection Configuration

Let's try adding a resource that requires broader permissions. Such as a branch protection rule that requires pull request approvals before merging to `main` branch.

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

1. Run `{{ tool_cmd }} apply` to try creating the branch protection rule
1. Notice the insufficient permissions. Let's solve that!

### ⌨️ Activity: Setup GitHub Authentication for Repository Management

Managing GitHub Repository settings required broader permissions, let's authenticate using GitHub CLI.

1. First, unset the existing token and authenticate with GitHub CLI using the required `repo` scope for managing repository settings.

   ```bash
   unset GITHUB_TOKEN
   gh auth login --scopes repo
   ```

1. Follow the interactive prompts to authenticate (choose HTTPS for Git operations when prompted).
1. Verify authentication by running `gh auth status`.
   > 🪧 **Note:** GitHub provider will automatically pick up the credentials from `gh` cli for all subsequent `{{ tool_cmd }}` commands. ([docs](https://registry.terraform.io/providers/integrations/github/latest/docs#github-cli))
1. Run `{{ tool_cmd }} apply` to create the branch protection rule
1. Verify the protection rule appears in your repository settings under Settings > Branches

<details>
<summary>Having trouble? 🤷</summary><br/>

- Add the branch protection resource to the end of your `main.tf` file, after the existing resources
- Make sure the indentation matches the other resources in your file
- If `{{ tool_cmd }} plan` shows errors, check that all braces and quotes are properly matched
- Verify the protection rule in your repository by going to Settings > Branches
- If the rule doesn't appear, check the terminal output for any error messages

</details>
