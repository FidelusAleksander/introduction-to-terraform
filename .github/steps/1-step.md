{% set valid_tool = tf_tool if tf_tool in ["terraform", "opentofu"] else "terraform" %}
{% set tool_display = "OpenTofu" if valid_tool == "opentofu" else "Terraform" %}
{% set tool_cmd = "tofu" if valid_tool == "opentofu" else "terraform" %}

## Step 1: Your First {{ tool_display }} Workflow

Your team has set up a basic {{ tool_display }} configuration to manage repository labels. This is your first hands-on experience with Infrastructure as Code - you'll run the standard {{ tool_display }} workflow commands to see how code becomes infrastructure. The configuration is already prepared, so you can focus on understanding the process.

### 📖 Theory: Understanding {{ tool_display }} Workflow

The {{ tool_display }} workflow follows a predictable pattern: initialize, plan, and apply. This three-step process ensures safe infrastructure changes by first downloading required providers, then showing you what will change, and finally executing those changes. You'll start with a simple repository label to understand this fundamental workflow.

- `{{ tool_cmd }} init` downloads providers and prepares your workspace
- `{{ tool_cmd }} plan` shows you what changes {{ tool_display }} will make
- `{{ tool_cmd }} apply` executes the planned changes to create or modify infrastructure
- {{ tool_display }} manages state to track what resources it controls

{% if valid_tool == "opentofu" %}
Learn more about [OpenTofu initialization](https://opentofu.org/docs/cli/commands/init/), [planning changes](https://opentofu.org/docs/cli/commands/plan/), [applying configurations](https://opentofu.org/docs/cli/commands/apply/), [GitHub provider](https://registry.terraform.io/providers/integrations/github/latest/docs), and [issue label resources](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label).
{% else %}
Learn more about [Terraform initialization](https://developer.hashicorp.com/terraform/tutorials/cli/init), [planning changes](https://developer.hashicorp.com/terraform/tutorials/cli/plan), [applying configurations](https://developer.hashicorp.com/terraform/tutorials/cli/apply), [GitHub provider](https://registry.terraform.io/providers/integrations/github/latest/docs), and [issue label resources](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label).
{% endif %}

### ⌨️ Activity: Startup Development Environment

1. Start your codespace and explore the workspace
1. Examine the pre-configured `main.tf` file structure
1. Review the {{ tool_display }} configuration syntax and understand what each section does
1. Familiarize yourself with the GitHub provider and issue label resource

### ⌨️ Activity: Run Your First {{ tool_display }} Workflow

1. Run `{{ tool_cmd }} init` to initialize the configuration
1. Run `{{ tool_cmd }} plan` to see what will be created
1. Run `{{ tool_cmd }} apply` to create the repository label
1. Verify the label was created in your repository

<details>
<summary>Having trouble? 🤷</summary><br/>

- If `{{ tool_cmd }} init` fails, check that you have internet connectivity for downloading providers
- If `{{ tool_cmd }} plan` shows no changes, verify your `main.tf` file contains the issue label resource
- If `{{ tool_cmd }} apply` fails with authentication errors, ensure your GitHub token is properly configured
- Check the repository's "Issues" tab and then "Labels" to verify the label was created

</details>
