# Issue tracker: Forgejo

Issues for this repo live as Forgejo issues. Use the [`fj`](https://codeberg.org/forgejo-contrib/forgejo-cli) CLI for all operations.
Run `fj -h` or `fj <command> -h` or `fj <command> <subcommand> -h` for more help.

## Conventions

- **Create an issue**: `fj issue create --body "<body>" <title>`
- **Create an issue with body file**: `fj issue create --body-file <body-file> <title>`
- **Search issues** (leave query blank to list issues): `fj issue search [--state <open, close, all>] <query>`
- **Read an issue**: `fj issue view <number>`
- **Comment on an issue**: `fj issue comment <issue> <body>`
- **Comment on an issue with body file**: `fj issue comment --body-file <body-file> <issue>`
- **Add a label**: `fj issue edit <issue> labels -a <label>`
- **Remove a label**: `fj issue edit <issue> labels -r <label>`
- **Close**: `fj issue close <number>`
- **Close with message**: `fj issue close -w "<message>" <issue>`

Infer the repo from `git remote -v`.

## Merge requests as a triage surface

**MRs as a request surface: no.** _(Set to `yes` if this repo treats external merge requests as feature requests; `/triage` reads this flag.)_

When set to `yes`, MRs run through the same labels and states as issues, using the `fj mr` equivalents.

## When a skill says "publish to the issue tracker"

Create a Forgejo issue.

## When a skill says "fetch the relevant ticket"

Run `fj issue view <number>`.

## Wayfinding operations

Used by `/wayfinder`. The **map** is a single issue with **child** issues as tickets.

- **Map**: a single issue labelled `wayfinder:map`.
- **Child ticket**: an issue carrying `Part of #<map>` at the top of its description and labels `wayfinder:<type>`.
- **Claim**: `fj issue edit <n> --assignee @me`.
- **Resolve**: `fj issue comment <n> --body "<answer>"`, then `fj issue close <n>`.
