## Step 3: When Resources Already Exist

Your team wants to add the repository itself to your Terraform configuration to manage its settings like description, visibility, and features. You'll add a repository resource and try to create it, but you'll discover that Terraform can't create something that already exists. This leads to an important concept in Infrastructure as Code - importing existing resources.

### 📖 Theory: Understanding Resource Conflicts

When adopting Infrastructure as Code for existing systems, you'll often encounter resources that already exist. Terraform expects to create and manage resources from scratch, so attempting to create an existing resource results in an error. This is where you learn about Terraform's import functionality, which allows you to bring existing infrastructure under Terraform management.

- Terraform assumes it will create all resources defined in your configuration
- Attempting to create existing resources results in conflicts and errors
- This scenario commonly occurs when transitioning existing infrastructure to IaC
- Understanding these errors helps you recognize when import is needed

Learn more about [GitHub repository resources](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) and [Terraform import concepts](https://developer.hashicorp.com/terraform/language/import).

### ⌨️ Activity: Add Repository Configuration and Encounter the Conflict

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

<details>
<summary>Having trouble? 🤷</summary><br/>

- Add the repository resource after the other resources in your `main.tf` file
- The error about repository already existing is expected - this demonstrates the need for import
- Make sure to create the new branch: `git checkout -b introduction-to-terraform`
- Push to the new branch: `git add . && git commit -m "Add repository config" && git push -u origin introduction-to-terraform`
- The error message will mention that the repository name is already taken

</details>
