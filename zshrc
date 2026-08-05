# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Rust auto completion
fpath+=~/.zfunc

# Zellij auto completion
fpath=(~/.zsh/completions $fpath)

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

plugins=(git
    zsh-syntax-highlighting
    zsh-autosuggestions
    web-search
    z
    you-should-use
    copyfile
    copypath
    docker
    aws
    pip
    poetry
    python
    ssh
    fzf-tab
    flutter
    direnv
    autoswitch_virtualenv)

unset VIRTUAL_ENV
source $ZSH/oh-my-zsh.sh

export HOMEBREW_NO_ASK=1
alias brewup='brew update && brew upgrade --formula'

alias python="python3"
alias gprom="git pull --rebase origin main"
alias co="checkout"
#
# "Cheap" mode - for 80% of tasks
alias cfast='claude --model haiku'

# "Deep" mode - for complex architecture/debugging
alias cdeep='claude --model sonnet'

# Created by `pipx` on 2024-11-23 20:13:48
export PATH="$PATH:/Users/zisiskostakakis/.local/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

zstyle ':completion:*:*:aws:*' file-patterns '*(-/)'
zstyle ':completion:*:*:aws:*' use-cache yes

if (( $+commands[aws_completer] )); then
  complete -C "$commands[aws_completer]" aws
fi
ssh-add ~/.ssh/m4-air-2025 >> /dev/null 2>&1

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# bun completions
[ -s "/Users/zisiskostakakis/.bun/_bun" ] && source "/Users/zisiskostakakis/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

typeset -U path
