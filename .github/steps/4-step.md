## Step 4: Importing Existing Infrastructure

You've encountered the classic Infrastructure as Code scenario - trying to manage existing resources with Terraform. The error message showed that the repository already exists and can't be created again. Now you'll learn how to solve this using Terraform's import functionality, bringing the existing repository under Terraform management without recreating it.

### 📖 Theory: Understanding Terraform Import

Terraform import is the solution for managing existing infrastructure. Instead of creating new resources, import tells Terraform about resources that already exist. You add an import block to your configuration, run Terraform commands, and the existing resource becomes managed by Terraform without any changes to the actual infrastructure.

- Import blocks declare existing resources that should be brought under Terraform management
- The import process maps real-world resources to your Terraform configuration
- After import, Terraform can manage changes to the resource going forward
- Import is safe - it doesn't modify the existing resource, only Terraform's knowledge of it

Learn more about [Terraform import](https://developer.hashicorp.com/terraform/language/import) and [import command usage](https://developer.hashicorp.com/terraform/cli/import).

### ⌨️ Activity: Import the Repository Resource

1. Add an import block to your `main.tf` configuration to import the existing repository
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

<details>
<summary>Having trouble? 🤷</summary><br/>

- Make sure the import block is placed at the root level of your `main.tf` file, not inside another block
- Verify the repository resource name matches exactly: `github_repository.repo`
- If the plan shows differences, check that your repository configuration matches the actual repository settings
- The import ID should be the repository name: "introduction-to-terraform"

</details>
