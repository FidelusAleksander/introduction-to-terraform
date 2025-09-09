## 💡 Hint for Step 1

<img src="https://octodex.github.com/images/mona-the-rivetertocat.png" alt="rivetertocat" width="200" align="right">

**Having trouble with the Terraform workflow?**

1. **Codespace issues?** Make sure the Codespace has fully loaded (VS Code interface should be complete)

2. **terraform init fails?** Check your internet connection - this command downloads the GitHub provider

3. **terraform plan shows nothing?** Verify your `main.tf` file exists and contains the `github_issue_label` resource

4. **terraform apply fails?** The default `GITHUB_TOKEN` in Codespaces should work for creating labels. Type exactly `yes` when prompted.

5. **Can't find the label?** Go to your repository → Issues tab → Labels to see the newly created label

**Quick check:** Your `main.tf` should have a `github_issue_label` resource block inside it!
