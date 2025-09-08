{% set valid_tool = tf_tool if tf_tool in ["terraform", "opentofu"] else "terraform" %}
{% set tool_display = "OpenTofu" if valid_tool == "opentofu" else "Terraform" %}
{% set tool_cmd = "tofu" if valid_tool == "opentofu" else "terraform" %}

## Step 1: Your First {{ tool_display }} Workflow

{% if valid_tool == "opentofu" %}

<img align="right" width="250px" src="https://www.vectorlogo.zone/logos/opentofu/opentofu-official.svg" />

**[OpenTofu](https://opentofu.org/)** is an open-source Infrastructure as Code (IaC) tool that enables you to define and provision infrastructure using declarative configuration files. It's a community-driven fork of [Terraform](https://developer.hashicorp.com/terraform).

{% else %}

<img align="right" width="250px" src="https://upload.wikimedia.org/wikipedia/commons/0/04/Terraform_Logo.svg" />

**[Terraform](https://developer.hashicorp.com/terraform)** is HashiCorp's Infrastructure as Code (IaC) tool that enables you to define and provision infrastructure using declarative configuration files.

{% endif %}

Instead of manually creating resources through web consoles or scripts, you write configuration files that describe your desired infrastructure state, and Terraform handles the complexity of creating, updating, and managing those resources.

Here is an example of creating a GitHub Repository Ruleset:

```hcl
resource "github_repository_ruleset" "example" {
  name        = "example"
  repository  = github_repository.example.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~ALL"]
      exclude = []
    }
  }

  rules {
    creation                = true
    update                  = true
    deletion                = true
    required_linear_history = true
    required_signatures     = false
  }
}
```

This repository contains a basic {{ tool_display }} configuration to manage GitHub labels. You will run the standard {{ tool_display }} workflow commands to see how code becomes infrastructure and see the effects on this repository!

### 📖 Theory: Understanding {{ tool_display }} Workflow

The {{ tool_display }} workflow follows a predictable pattern: initialize, plan, and apply. This three-step process ensures safe infrastructure changes by first downloading required providers, then showing you what will change, and finally executing those changes. You'll start with a simple repository label to understand this fundamental workflow.

- `{{ tool_cmd }} init` downloads providers and prepares your workspace
- `{{ tool_cmd }} plan` shows you what changes {{ tool_display }} will make
- `{{ tool_cmd }} apply` executes the planned changes to create or modify infrastructure
- {{ tool_display }} manages state to track what resources it controls

{% if valid_tool == "opentofu" %}
> [!TIP]
> **Learn more:**
>
> - [OpenTofu commands](https://opentofu.org/docs/cli/commands/)
> - [GitHub provider](https://registry.terraform.io/providers/integrations/github/latest/docs)
{% else %}
> [!TIP]
> **Learn more:**
>
> - [Terraform commands](https://developer.hashicorp.com/terraform/cli/commands)
> - [GitHub provider](https://registry.terraform.io/providers/integrations/github/latest/docs)
{% endif %}

### ⌨️ Activity: Startup Development Environment

1. Use the below button to open the **Create Codespace** page in a new tab. Use the default configuration.

   [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/{{full_repo_name}}?quickstart=1)

1. Wait a moment for Visual Studio Code to fully load in your browser. This can take a minute or two.

### ⌨️ Activity: Run Your First {{ tool_display }} Workflow

1. Examine the pre-configured `main.tf` file structure
   1. Review the {{ tool_display }} configuration syntax and understand what each section does
   1. Familiarize yourself with the GitHub provider and issue label resource
1. Run `{{ tool_cmd }} init` to initialize the configuration
1. Run `{{ tool_cmd }} plan` to see what will be created
1. Run `{{ tool_cmd }} apply` to create the repository label.
   1. You will be asked to confirm the resource creation. Type `yes` when prompted.
1. Verify the label was created in your repository

<details>
<summary>Having trouble? 🤷</summary><br/>

- If `{{ tool_cmd }} init` fails, check that you have internet connectivity for downloading providers
- If `{{ tool_cmd }} plan` shows no changes, verify your `main.tf` file contains the issue label resource
- If `{{ tool_cmd }} apply` fails with authentication errors, ensure your GitHub token is properly configured
- Check the repository's "Issues" tab and then "Labels" to verify the label was created

</details>
