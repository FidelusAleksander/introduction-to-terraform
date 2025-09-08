{% set valid_tool = tf_tool if tf_tool in ["terraform", "opentofu"] else "terraform" %}
{% set tool_display = "OpenTofu" if valid_tool == "opentofu" else "Terraform" %}
{% set tool_cmd = "tofu" if valid_tool == "opentofu" else "terraform" %}

## Review

_Congratulations, you've completed this exercise and learned a lot about Infrastructure as Code with {{ tool_display }}!_

<img src="https://octodex.github.com/images/jetpacktocat.png" alt="celebrate" width=200 align=right>

Here's a recap of your accomplishments:

- Understanding the {{ tool_display }} workflow: init, plan, apply
- Adding new resources to expand infrastructure management
- Managing GitHub repository settings as code
- Setup different ways of authentication with GitHub
