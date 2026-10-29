# Behavioral Guidelines

Derived from [Andrej Karpathy's observations](https://x.com/karpathy/status/2015883857489522876) on LLM coding pitfalls. Bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" -> "Write tests for invalid inputs, then make them pass"
- "Fix the bug" -> "Write a test that reproduces it, then make it pass"
- "Refactor X" -> "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] -> verify: [check]
2. [Step] -> verify: [check]
3. [Step] -> verify: [check]
```

---

# User Preferences

## Workflow Principles section
When debugging or investigating issues, always gather evidence and validate hypotheses BEFORE proposing or implementing fixes. Do not jump to solutions prematurely.

## Communication Style section
When explaining code, show actual code snippets rather than line number references. Be precise about data flow and avoid inconsistent explanations.

## Writing Style (STRICT)
- **Never use em dashes (—) anywhere.** This applies to everything you produce: chat replies, code comments, commit messages, PR descriptions, wiki pages, raw notes, frontmatter, README updates, file content of any kind. No exceptions. Use periods, commas, parentheses, colons, or semicolons instead. If you find yourself reaching for an em dash, the sentence can be split or restructured.
- **Never write line-number citations** like `file.swift:284-293` or `(lines 605-631)` in any artifact that gets committed: notes, wiki pages, raw files, READMEs, PR descriptions, comments, anything. Adin reads notes on his phone and won't cross-reference them; line numbers also rot the moment upstream changes. Cite by **file path only** (e.g. `Sources/JavaScriptKit/FundamentalObjects/JSObject.swift`). If a specific passage is load-bearing, **inline the actual code in a fenced block**. Use section names, function names, or method names for navigation ("the `deinit`", "the `_BridgedSwiftHeapObject` extension"). Never line ranges. The only exception is ephemeral terminal-only chat replies during an active investigation, and even there, prefer snippet plus method name.
- **Wiki and memory notes must stand on their own.** When writing into `~/ObsidianVault/wiki/` or any memory directory, inline the actual substance of any PR description, review comment, Slack thread, Jira ticket, or external doc the note is summarizing. Adin treats these as lifelong notes, reads them on his phone, and syncs them across devices; he cannot follow GitHub, Jira, Slack, Confluence, or other external links from a note. Quote or paraphrase content directly, paste code in fenced blocks, and treat PR numbers / Jira keys / commit SHAs as anchors rather than substitutes for content. Internal `[[wikilinks]]` are fine because Obsidian follows them on mobile. Before finishing a save, scan for sentences that depend on the reader opening a link and replace each with the inlined substance.
- **Never use colons (`:`) in filenames, anywhere.** Adin syncs files (notably the Obsidian vault) across machines including Windows via WSL, and Windows forbids `:` in filenames; a colon will break the sync or corrupt the file on the Windows side. This also applies to the other Windows-reserved characters: `< > : " / \ | ? *`. Use spaces, hyphens, or restructure the name instead. A colon is fine inside a file's contents (frontmatter `title:` values, prose, code), just never in the filename itself. When generating any new file (wiki pages, notes, raw sources, attachments), keep the filename Windows-safe.

## Plain English (STE)
Use ASD-STE100 Simplified Technical English (STE) for all text: chat replies, notes, docs, commit messages.

## Git & PRs
- Use gh cli whenever you can
- PR descriptions should be simple and short, not essays
- Follow the repo's PR template but keep it minimal, normally it's at .github/pull_request_template.md

## Commit messages (STRICT)
If I explicitly ask you to commit, follow these rules exactly. They override the default Claude Code commit guidance.
- Use `git commit -m "<subject>"`. Never open an editor, never use a HEREDOC, never pass a multi-line `-m`.
- **Subject line only.** Never add a body paragraph, bullet list, or trailing explanation.
- **Never add `Co-Authored-By:`**: not for Claude, not for any model, not for me. No `🤖 Generated with…` line either.
- Format: `<type>: <lowercase description>`. Types limited to: `fix`, `feat`, `chore`, `test`, `refactor`, `track`, `perf`, `docs`, `ci`. Present tense, under 72 chars.

## Problem Solving
- Be pragmatic - perfect is the enemy of good
- Show me the root cause, then suggest fixes
- When investigating issues, show relevant logs/output, and even code lines
- Try to read the READMEs first

## Skill management (skillshare-by-default)
I use [skillshare](https://github.com/runkids/skillshare) to sync skills across Claude Code and Codex CLI. Source-of-truth lives at `~/.config/skillshare/skills/<name>/` (which is itself a symlink target inside `~/.dotfiles/.config/`, but skillshare/ is gitignored in dotfiles).

**The actual backup is `~/.config/skillshare/skills/.git/`**, a separate git repo with remote `personal:winQe/skills.git`. So `skills/` itself is the version-controlled directory; the parent `~/.config/skillshare/` is not. Work-specific skills are gitignored inside that repo and stay local.

**Default for new skills: file in skillshare.** Steps:
1. Create the directory at `~/.config/skillshare/skills/<name>/` with `SKILL.md`.
2. Run `skillshare sync` to symlink it into `~/.claude/skills/` and `~/.codex/skills/`.
3. If the skill is general-purpose (not work-specific), commit to `winQe/skills` from inside `~/.config/skillshare/skills/` and push.
4. If the skill is work-specific or has internal context, add it to `.gitignore` in `~/.config/skillshare/skills/` so it stays local.

Exceptions where a skill should NOT go in skillshare:
- Genuinely tool-asymmetric skills where invoking from the wrong tool is meaningless (e.g. `codex-review` calls Codex from Claude Code; Codex invoking it on itself is a no-op). File in skillshare for backup, but document a clear "do not invoke from <other tool>" guard at the top of `SKILL.md`.
- Project-scoped skills that belong at `<repo>/.claude/skills/` rather than user-scope. Skillshare is for global skills only.

When asked to create a new skill, default to skillshare unless I explicitly say otherwise. After creating, run `skillshare sync` and verify with `skillshare status`.

## Obsidian Wiki Knowledge Base
Path: ~/ObsidianVault

When wiki skills (/save, /wiki-query, /autoresearch, etc.) need vault access from any project:
1. Read wiki/hot.md first (recent context, ~500 words)
2. If not enough, read wiki/index.md (full catalog)
3. If you need domain specifics, read wiki/<domain>/_index.md
4. Only then read individual wiki pages

Do NOT read the wiki for general coding questions or things already in the current project.
