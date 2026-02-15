---
description: Log conversation activity to today's daily note
allowed-tools: Bash, Read, Write
---

Append a structured summary of current session activity to today's daily note, providing the data layer the vault-analyst reads to discover your work patterns.

<output_file>
This command writes to the daily journal file at `VAULT_ROOT/areas/journal/YYYY/MM - MMMM/DD.md`, where `VAULT_ROOT` is an environment variable
</output_file>

<log_format>
```markdown
### Session Log - [TIME]

**Focus:** [1-2 sentence summary of main work]

#### Completed
- [Concrete outcome 1]
- [Concrete outcome 2]

#### Decisions Made
| Decision   | Rationale |
|------------|-----------|
| [Decision] | [Why]     |

#### Files Created/Modified
- [[filename]] - [what/why]

#### Next Steps
- [Follow-up task if any]

```
</log_format>

<workflow_steps>
**Workflow:**
1. **Analyze the conversation** for:
   - Main topics/tasks worked on
   - Concrete outputs (files created, code written, research done)
   - Decisions made and their rationale
   - Outstanding items or next steps

2. **Locate today's daily note**
   - Check default path: `VAULT_ROOT/areas/journal/YYYY/MM - MMMM/DD.md`, where `VAULT_ROOT` is an environment variable
   - Create if it doesn't exist by copying `VAULT_ROOT/areas/__metadata/templates/daily.md`
   - If path unclear, ask user

3. **Append the session log** to the "Session Logs" section using the <log_format/> above
   - Include timestamp (user's local time)
   - Be specific about outcomes, not activities
   - Link to created files with `[[wikilinks]]`

4. **Confirm** what was logged
</workflow_steps>

<quality_guidelines>
**Good entries:**
- "Created YouTube analytics inbox item with 3 integration options"
- "Refactored authentication to use JWT instead of sessions"
- "Decision: Use Postgres over SQLite (need concurrent writes)"

**Bad entries:**
- "Worked on stuff"
- "Had a conversation about the project"
- "Did some research"

**Be specific.** Capture what was DONE, not what was discussed.

**Why this matters:** Vault-analyst reads these logs to find patterns. Vague entries = weak pattern detection. Specific entries = actionable automation recommendations.
</quality_guidelines>

<example_output>
### Session Log - 2:45 PM

**Focus:** Local LLM integration for cost optimization

#### Completed
- Overhauled inbox-processor with local_classify integration
- Created keep-warm launchd agent for Ollama (4-min interval)
- Tested classification accuracy on inbox items (~66%)

#### Decisions Made
| Decision | Rationale |
|----------|-----------|
| Hybrid local/cloud pattern | Local does mechanical work, Claude does judgment |
| 4-minute keep-warm interval | Prevents cold start without wasting resources |

#### Files Created/Modified
- [[inbox-processor]] - Added local LLM pre-classification
- [[local-llm-hybrid]] - NEW: Pattern documentation

#### Next Steps
- [ ] Monitor token savings over next week
- [ ] Apply pattern to slop-detector skill

---
</example_output>

<success_criteria>
- [ ] Today's daily note exists (create if not)
- [ ] Session log appended with separator
- [ ] Specific outcomes documented (not just activities)
- [ ] Any created files linked with wikilinks
- [ ] User informed of what was logged
</success_criteria>