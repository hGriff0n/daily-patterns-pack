---
name: log-to-daily
description: Log conversation activity to today's daily note on demand. Use when wrapping up work, capturing decisions, or documenting session outcomes. Use when the user asks to log to daily note, capture session activity, document what was done, or record decisions made during the conversation.
disable-model-invocation: true
---

<objective>
Append a structured summary of current session activity to today's daily note. This creates the data layer that vault-analyst reads to discover your work patterns.
</objective>

<when_to_use>
- End of a work session (before closing Claude)
- After completing a significant piece of work
- When important decisions were made that should be recorded
- When the user explicitly requests logging
- Mid-session when switching contexts

**NOT needed when:**
- Just chatting without meaningful work output
- Quick questions with no decisions or outcomes
</when_to_use>

<execution>
Use the **@commands/log.md** command to execute this skill.

The command handles:
- Locating/creating today's daily note (`VAULT_ROOT/areas/journal/YYYY/MM - MMMM/DD.md`)
- Formatting the session log with timestamp
- Appending to the "Session Logs" section
- Linking files with wikilinks
- Confirming what was logged

See @commands/log.md for complete log format, workflow steps, quality guidelines, and examples.
</execution>

<companion_tool>
This skill creates data. **@vault-analyst** reads it.

After 2+ weeks of consistent logging, run `@vault-analyst` to discover:
- Recurring tasks you could automate
- Time-of-day patterns in your work
- Friction points that keep appearing
- Specific skills/agents to build

The more you log, the better the pattern detection.
</companion_tool>
