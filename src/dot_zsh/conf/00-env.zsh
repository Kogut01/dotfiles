# -----------------
# 0. MAIN SETTINGS
# -----------------
export LANG="pl_PL.UTF-8"
export TERM_PROGRAM="ghostty"
export TERM="xterm-256color"
export COLORTERM="truecolor"

export PATH="$HOME/.local/bin:$PATH"
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"


# ------------
# 1. Commands
# ------------
bindkey -e
ulimit -n 2048