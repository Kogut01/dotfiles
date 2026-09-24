# -----------------
# 0. MAIN SETTINGS
# -----------------
export LANG="pl_PL.UTF-8"
export TERM_PROGRAM="ghostty"
export PATH="$HOME/.local/bin:$PATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"


# ------------
# 1. SSH Agent
# ------------
if [[ -S "$HOME/.bitwarden-ssh-agent.sock" && ( -z "$SSH_AUTH_SOCK" || ! -S "$SSH_AUTH_SOCK" ) ]]; then
    export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"
fi


# ------------
# 2. Homebrew
# ------------
if [[ -x "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /etc/debian_version && -x "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


# ------------
# 3. Commands
# ------------
bindkey -e
ulimit -n 2048