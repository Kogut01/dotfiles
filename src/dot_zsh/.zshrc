# --- MAIN SETTINGS ---
export LANG="pl_PL.UTF-8"
export EDITOR="nvim"
export TERM="xterm-256color"
export COLORTERM="truecolor"
export PATH="$HOME/.local/bin:$PATH"


# -------- Ghostty --------
export TERM_PROGRAM="ghostty"


# ------- OH-MY-ZSH --------
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


# - Plugins -
plugins=(
  git
  sudo
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-autocomplete
)


# ------------- OH-MY-POSH -------------
if command -v oh-my-posh >/dev/null 2>&1; then
    eval "$(oh-my-posh init zsh --config ~/.dotfiles/data/zsh_theme/emodipt-extend.omp.json)"
fi


# --------- Colors -----------
alias grep='grep --color=auto'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30'


# ------- ALIASY --------
alias ls='ls --color=auto'
alias la='ls -laF --color=auto'
  
alias vi='nvim'
alias ff='fastfetch'


