# --- MAIN SETTINGS ---
export LANG="pl_PL.UTF-8"
export EDITOR="nvim"
export TERM="xterm-256color"
export COLORTERM="truecolor"
export PATH="$HOME/.local/bin:$PATH"


# -------- Ghostty --------
export TERM_PROGRAM="ghostty"


# ---------- Plugins ----------
source ~/.zsh-plugins/znap/znap.zsh

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source marlonrichert/zsh-autocomplete
znap source ohmyzsh/ohmyzsh plugins/sudo
znap source ohmyzsh/ohmyzsh plugins/colored-man-pages


# --------- Colors -----------
alias grep='grep --color=always'


# ------- ALIASY --------
alias ls='lsd -l'
alias la='lsd -la'
alias lt='lsd --tree'
  
alias vi='nvim'
alias ff='fastfetch'


# ------------- OH-MY-POSH -------------
eval "$(oh-my-posh init zsh --config ~/.dotfiles/src/dot_zsh/theme/zsh_theme.omp.json)"