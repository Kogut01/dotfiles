# --- MAIN SETTINGS ---
export LANG="pl_PL.UTF-8"
export EDITOR="nvim"
export TERM="xterm-256color"
export COLORTERM="truecolor"
export PATH="$HOME/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"


# -------- Ghostty --------
export TERM_PROGRAM="ghostty"


# - Plugins -
plugins=(
  sudo
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-autocomplete
)


# ------------- OH-MY-POSH -------------
eval "$(oh-my-posh init zsh --config ~/.dotfiles/data/dot_themes/zsh_theme.omp.json)"


# ------ OH-MY-ZSH ------
source $ZSH/oh-my-zsh.sh


# --------- Colors -----------
alias grep='grep --color=always'


# ------- ALIASY --------
alias ls='lsd -l'
alias la='lsd -la'
alias lt='lsd --tree'
  
alias vi='nvim'
alias ff='fastfetch'
