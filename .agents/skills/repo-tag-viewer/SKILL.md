---
name: Git Subrepo Release Tag Viewer
description: Parses the project Makefile, extracts external Git repository URLs, fetches their release tags, and displays them in a clean tabular view.
triggers:
  - "show release tags"
  - "list external tags"
  - "fetch subrepo versions"
---

# Instruction Workflow for Git Subrepo Release Tag Viewer

You are an expert release engineer skill. Your goal is to fetch, organize, and display the release tags of all subrepos configured within this project.

### Step 1: Scan Makefile
Inspect the root `Makefile` to identify any external GitHub repositories or targets related to external tags (such as `fetch-external-tags`).

### Step 2: Extract Repository URLs
Parse the `.gitmodules` file to identify all external repository URLs configured as subrepos.

### Step 3: Fetch Tag Data with Dates
For each repository, execute the following command to retrieve tags with their commit dates:
```bash
git ls-remote --tags --sort=-version:refname <repository_url> | head -20
```

Then, for each tag's commit SHA, fetch the author date by running:
```bash
git log -1 --format=%ai <commit_sha> 2>/dev/null || echo "unknown"
```

Combine the tag name, commit SHA, and author date into tuples.

### Step 4: Parse and Clean Data
* Isolate the tag name (strip out references like `refs/tags/` or `^{}`).
* Capture the corresponding Commit SHA.
* Extract and format the author date (e.g., `DD-MM-YYYY` or full timestamp).
* Filter the list to display only the **5 most recent tags** per repository to avoid bloating the output.

### Step 5: Render Tabular Output
Format your response as a Markdown table followed by a summary section.

**Table schema:**

| Repository Name | Release Tag | Commit SHA | Authored Date | Location |
| :--- | :--- | :--- | :--- | :--- |
| organization/repo-name | v2.4.1 | 8f3b2a1c... | 2026-02-02 | External GitHub |

If a repository does not have any tags published, output: `| organization/repo-name | No tags found | - | - | External GitHub |`.

### Step 6: Append Summary Section
After the table, add a **Summary** section with each repository on a **separate line** (NOT in a code block):

**Summary:**

📦 peppol-bis-invoice-3 → latest: v3.0.20 - 2026-02-02

📦 poacc-upgrade-3 → latest: v3.0.15 - 2026-01-15

📦 logistics-bis → No release tags published

Use the format:
- `📦 {repo-name} → latest: {tag} - {date}` if tags exist (date as YYYY-MM-DD)
- `📦 {repo-name} → No release tags published` if no tags exist
Each line must be followed by a blank line for clear separation.

