---
name: handoff
description: Generates a delta-summary of the current chat session to be exported as a handoff file.
---
Execute `handoff` protocol. 

Generate a concise Markdown summary of the net-new progress made in THIS specific chat session. 

CRITICAL RULE: Do NOT summarize or repeat any baseline context, background information, or code that was provided at the start of this session via earlier handoffs. I only want the delta—what we actually built, decided, or debugged today.

Format the output strictly using the structure below so I can save it directly to a file. Do not include conversational filler before or after the Markdown.

# Handoff: [Insert Sub-Topic Here]

## Net-New Progress
* [Bullet points of exact achievements, architectural decisions, or logic established]

## Key Artifacts
* [Finalized code snippets, configurations, or data structures developed in this session]

## Unresolved Issues
* [Specific bugs, blockers, or missing pieces discovered]

## Next Steps
* [Immediate action items for the next chat session to pick up]
