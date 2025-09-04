# Extract State Labels Action

This composite action extracts labels with the `state::` prefix from GitHub issues and converts them to JSON format for use in workflows.

## Usage

```yaml
- name: Extract state labels
  id: extract-state
  uses: ./.github/actions/extract-state-labels
  with:
    issue-number: ${{ github.event.issue.number }}
    github-repository: ${{ github.repository }}
    github-token: ${{ github.token }}

- name: Use extracted state
  run: |
    echo "tf_tool: ${{ fromJson(steps.extract-state.outputs.state).tf_tool }}"
```

## Inputs

| Input               | Description                            | Required | Default                    |
| ------------------- | -------------------------------------- | -------- | -------------------------- |
| `issue-number`      | Issue number to extract labels from    | Yes      | -                          |
| `github-repository` | GitHub repository in owner/repo format | No       | `${{ github.repository }}` |
| `github-token`      | GitHub token                           | No       | `${{ github.token }}`      |

## Outputs

| Output  | Description                                                   |
| ------- | ------------------------------------------------------------- |
| `state` | JSON string of extracted state data for use with `fromJson()` |

## Label Format

Labels should follow the pattern: `state::<key>::<value>`

Examples:

- `state::tf_tool::tofu` → `{"tf_tool": "tofu"}`
- `state::step::2` → `{"step": 2}`
- `state::environment::prod` → `{"environment": "prod"}`

Multiple state labels can be present on the same issue:

- Labels: `state::tf_tool::tofu`, `state::step::2`
- Output: `{"tf_tool": "tofu", "step": 2}`

## Example Integration

```yaml
# Extract state from issue
- name: Extract state labels
  id: extract-state
  uses: ./.github/actions/extract-state-labels
  with:
    issue-number: ${{ env.ISSUE_NUMBER }}

# Use state in comment action
- name: Create comment with tool context
  uses: GrantBirki/comment@v2.1.1
  with:
    repository: ${{ github.repository }}
    issue-number: ${{ env.ISSUE_NUMBER }}
    file: path/to/template.md
    vars: |
      tf_tool: ${{ fromJson(steps.extract-state.outputs.state).tf_tool || 'terraform' }}
```

## Features

- Handles multiple state labels on a single issue
- Automatically converts numeric values to integers
- Supports nested values with multiple `::` separators
- Provides JSON output compatible with GitHub Actions `fromJson()` function
- Includes error handling and debug logging
