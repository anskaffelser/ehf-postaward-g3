# Presentation: Git Subrepo Release Tag Viewer (`repo-tag-viewer`)

## Slide 1 - Title
**Git Subrepo Release Tag Viewer**

A skill that helps teams monitor external Peppol repository releases and verify release announcements with concrete tag evidence.

---

## Slide 2 - Problem Area
### 1) Release visibility and tracking
- Teams need to keep track of **new releases** from Peppol repositories.
- Release information must include both:
  - **Release tag** (for version traceability)
  - **Release date** (for timeline/announcement planning)

### 2) Announcement validation
- When Peppol asks partners to announce or adopt a new release, product owners must validate:
  - Does the release actually exist in the repo?
  - Is the **version tag correct** (no mismatch/typo)?
  - Is the release timing aligned with communication plans?

---

## Slide 3 - What This Skill Does
The `repo-tag-viewer` skill automates release discovery and reporting:

1. Scans the root `Makefile` for external repo setup and tag-fetch flow.
2. Uses the fastest available discovery method:
   - Prefer `make fetch-external-tags` when the target exists.
   - Otherwise use `git ls-remote --tags <repo>` per repository.
3. Cleans raw Git refs into readable release data:
   - Tag name
   - Commit SHA
   - Repository source/location
   - Date field (when available in collection flow)
4. Returns results in a **clean markdown table** for decision-making.

---

## Slide 4 - Files Involved in This Skill
### A) Skill definition file
- **`.agents/skills/repo-tag-viewer/SKILL.md`**
- Defines:
  - Purpose
  - Trigger phrases
  - Workflow steps
  - Output table format

### B) Project automation file
- **`Makefile`**
- Contains the `fetch-external-tags` target used by the skill for centralized tag retrieval.

### C) External data sources (read-only)
- GitHub repositories such as:
  - `OpenPEPPOL/peppol-bis-invoice-3`
  - `OpenPEPPOL/poacc-upgrade-3`
  - `OpenPEPPOL/logistics-bis`

### D) Runtime tooling
- Git CLI commands (`git ls-remote`, `git for-each-ref`, `git fetch --tags`) used to collect and normalize release info.

---

## Slide 5 - How the Skill Is Triggered
Configured trigger phrases in `SKILL.md`:
- `show release tags`
- `list external tags`
- `fetch subrepo versions`

Typical user request examples:
- "List external tags from Peppol"
- "Show latest release tags with dates"
- "Fetch subrepo versions for external repos"

---

## Slide 6 - End Result Format
The skill returns a markdown table, for example:

| Repository Name | Release Tag | Commit SHA | Location | Date |
| :--- | :--- | :--- | :--- | :--- |
| OpenPEPPOL/peppol-bis-invoice-3 | v3.0.20 | 261c4584... | External GitHub | 2026-03-16 |
| OpenPEPPOL/poacc-upgrade-3 | v3.0.15 | 0e7e5c79... | External GitHub | 2025-05-29 |
| OpenPEPPOL/logistics-bis | No tags found | - | External GitHub | - |

---

## Slide 7 - How This Helps Product Owners
### Faster release decisions
- Immediate visibility into what was actually released.

### Safer external communication
- Prevents announcing incorrect versions.

### Better compliance and traceability
- Keeps release tag + date + SHA evidence in one place.

### Stronger planning and coordination
- Supports roadmap updates, customer communication, and rollout readiness.

---

## Slide 8 - Suggested Operating Workflow
1. Run the skill when a Peppol release notice is received.
2. Validate announced version against fetched tags.
3. Share table output in product/release channels.
4. Proceed with communication only after tag/date verification.

