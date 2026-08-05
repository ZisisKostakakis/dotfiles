# dotfiles

Personal macOS dotfiles. Root shell files link to `~/.*`; selected `config/`
directories link under `~/.config/`; `config/claude` and `config/codex` provide
global agent guidance.

Install from the repository root, in order:

```sh
./install-dependencies.sh
./install-oh-my-zsh.sh
./install-dot.sh
```

Verify with `./check`.

Tracked files are symlink sources of truth. `install-dot.sh` refuses to replace
real existing files; inspect or move them yourself before linking. Use the
repository's existing test runner for changes; do not assume `pytest`.

Do not commit or push unless requested. For independent work, use a native Git
worktree rather than sharing a checkout.
