# --- MAIN SETTINGS ---
export LANG="pl_PL.UTF-8"
export TERM="xterm-256color"
export COLORTERM="truecolor"
export PATH="$HOME/.local/bin:$PATH"
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"


# -------- Ghostty --------
export TERM_PROGRAM="ghostty"
bindkey -e
ulimit -n 2048

# ---------- Plugins ----------
[[ -r ~/.zsh-plugins/znap/znap.zsh ]] ||
    git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git ~/.zsh-plugins/znap

source ~/.zsh-plugins/znap/znap.zsh

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source marlonrichert/zsh-autocomplete
znap source ohmyzsh/ohmyzsh plugins/sudo


# --------- Colors -----------
alias grep='grep --color=always'


# ------- ALIASY --------
alias ls='lsd -l'
alias la='lsd -la'
alias lt='lsd --tree'

alias vi='nvim'
alias ff='fastfetch'

alias ranger='spf'

# ------------- OH-MY-POSH -------------
eval "$(oh-my-posh init zsh --config ~/.dotfiles/src/dot_zsh/theme/zsh_theme.omp.json)"