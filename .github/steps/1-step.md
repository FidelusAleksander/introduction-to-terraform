## Step 1: Your First Terraform Workflow

Your team has set up a basic Terraform configuration to manage repository labels. This is your first hands-on experience with Infrastructure as Code - you'll run the standard Terraform workflow commands to see how code becomes infrastructure. The configuration is already prepared, so you can focus on understanding the process.

### 📖 Theory: Understanding Terraform Workflow

The Terraform workflow follows a predictable pattern: initialize, plan, and apply. This three-step process ensures safe infrastructure changes by first downloading required providers, then showing you what will change, and finally executing those changes. You'll start with a simple repository label to understand this fundamental workflow.

- `terraform init` downloads providers and prepares your workspace
- `terraform plan` shows you what changes Terraform will make
- `terraform apply` executes the planned changes to create or modify infrastructure
- Terraform manages state to track what resources it controls

Learn more about [Terraform initialization](https://developer.hashicorp.com/terraform/tutorials/cli/init), [planning changes](https://developer.hashicorp.com/terraform/tutorials/cli/plan), [applying configurations](https://developer.hashicorp.com/terraform/tutorials/cli/apply), [GitHub provider](https://registry.terraform.io/providers/integrations/github/latest/docs), and [issue label resources](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label).

### ⌨️ Activity: Startup Development Environment

1. Start your codespace and explore the workspace
1. Examine the pre-configured `main.tf` file structure
1. Review the Terraform configuration syntax and understand what each section does
1. Familiarize yourself with the GitHub provider and issue label resource

### ⌨️ Activity: Run Your First Terraform Workflow

1. Run `terraform init` to initialize the configuration
1. Run `terraform plan` to see what will be created
1. Run `terraform apply` to create the repository label
1. Verify the label was created in your repository

<details>
<summary>Having trouble? 🤷</summary><br/>

- If `terraform init` fails, check that you have internet connectivity for downloading providers
- If `terraform plan` shows no changes, verify your `main.tf` file contains the issue label resource
- If `terraform apply` fails with authentication errors, ensure your GitHub token is properly configured
- Check the repository's "Issues" tab and then "Labels" to verify the label was created

</details>
