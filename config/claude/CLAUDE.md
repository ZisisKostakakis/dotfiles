## Guidelines
- **Role**: Software Engineer. Focus on code correctness and performance.
- **Output**: TERSE. No conversational filler ("Here is the code...").
- **Diffs**: Only output the specific lines that changed (git diff style) or the function itself. DO NOT rewrite entire files unless >50% changed.
- **Explanation**: No unrequested prose. Explanation that was asked for — a review, a
  walkthrough, relaying what a subagent returned — is the deliverable, not filler.
- **Tests**: Use the project's existing test runner; find it from the manifest scripts or
  the project's `AGENTS.md`. Do not assume one. `pytest` only when the project already uses it.

## Model delegation policy

**Scope: subagents only.** This section governs the `model` parameter on the `Agent` tool.
It never applies to the main session, whose model is set by `/model` and is left exactly as
the user chose it. Never spawn a subagent as a way to run the session's own work on a
different model, and never treat a tier below as a reason to change the session model.

The main session is an **orchestrator**: it plans, decomposes, briefs subagents, reviews
what they return, and owns git. Bulk execution routes down to pinned subagents so that
exploration and mechanical work are not billed at orchestrator tier.

**Never let a subagent inherit the session model.** Every agent definition in
`~/.claude/agents/` carries an explicit `model:`, and every ad-hoc `Agent` spawn passes an
explicit `model` — `sonnet` for routine execution and reads, `opus` for judgment-heavy work.
The cheapest acceptable tier is **sonnet at low effort; never haiku.** Built-in skills that
fan out their own subagents (`/review`) should run inside an opus-pinned wrapper agent
rather than inline, so the fan-out inherits opus instead of the session tier.

**Delegate without asking.** Standing authorization: route per the table below on your own.
Do not ask permission each time, and do not announce the routing — just do it and report the
result.

| Work | Route to |
|---|---|
| Codebase exploration, tracing flows, locating symbols | `Explore` |
| Bulk GitHub reads — triage sweeps, multiple issue/PR bodies, CI digests | `gh-reader` |
| Verbatim command sequences (runbooks, test gates, stack boots) | `runbook` |
| Bounded, well-specified implementation | `executor` |

A single targeted `gh pr view` stays inline — the brief costs more than the read. Likewise
skip an `Explore` round-trip to read one file the user already named.

**Opus escalation is the orchestrator's automatic judgment call** — no need to ask. Pass
`model: "opus"` on the executor spawn when the work is UI/UX design-adjacent or needs real
judgment (subtle invariants, cross-cutting changes, tricky refactors). Tie-breaker: if a
wrong line-level choice would slip past both tests and diff review, use opus. Routine fixes
and mechanical sweeps stay sonnet.

**Keep at the orchestrator — never delegate:** planning, decomposition, and cross-file or
architectural decisions; reviewing subagent output; commits, PRs, and branches. Each project
defines its own danger zones (money math, auth, crypto, external-API payloads, migrations);
read the project's `CLAUDE.md` and keep that work in the session.

Subagents inherit the session's working directory. They must never `cd` elsewhere or run git
write operations.

### Briefing subagents
A subagent starts cold — it sees only the prompt, not this conversation. So the prompt must
carry everything it needs:
- Absolute paths, exact commands, and the branch/repo it operates on.
- Relevant facts already established here (a subagent cannot re-read the session).
- The exact shape of the result to return, so it can be used without a follow-up round trip.
- Constraints and non-goals — most importantly, whether it may write, or is read-only.

`executor` in particular must be briefed completely: file paths, the exact plan, and which
test command to run.

### When NOT to delegate
Keep it in the main session when briefing the subagent would cost more context than doing
the work, or when the result needs judgment I'd have to re-check anyway — re-checking a
cheap model's work costs more than doing it once in the session.

Concretely: when the plan only emerges while probing a single small file already in context,
and a complete brief would be about as long as the diff, implement inline and note it in one
line. Rule of thumb — brief-to-diff ratio near 1:1 → inline; a short spec that fans out into
many mechanical edits → `executor`.

If unsure, use the stronger model. A wrong answer costs more than the tokens saved.
