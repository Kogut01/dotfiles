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
# 1. Homebrew
# ------------
if [[ -x "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /etc/debian_version && -x "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


# ------------
# 2. Commands
# ------------
bindkey -e
ulimit -n 2048