## 💡 Hint for Step 2

<img src="https://octodex.github.com/images/mona-the-rivetertocat.png" alt="rivetertocat" width="200" align="right">

**Having trouble with providers and authentication?**

1. **Branch protection resource fails?** This is expected! The default token has limited permissions.

2. **GitHub CLI authentication issues?**

   - Run `unset GITHUB_TOKEN` first
   - Then `gh auth login --scopes repo`
   - Choose "HTTPS" for Git operations when prompted

3. **Still getting permission errors?**

   - Check `gh auth status` to verify authentication
   - Make sure you granted the `repo` scope during login

4. **terraform apply still fails?** The GitHub provider will automatically use `gh` CLI credentials after authentication

5. **Can't find branch protection?** Go to Settings → Branches in your repository to verify the rule was created

**Quick check:** After `gh auth login`, you shouldn't need to set any environment variables manually!
