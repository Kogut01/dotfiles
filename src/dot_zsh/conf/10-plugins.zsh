# -----------
# 0. Plugins 
# -----------
[[ -r ~/.config/.zsh-plugins/znap/znap.zsh ]] ||
    git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git ~/.config/.zsh-plugins//znap

source ~/.config/.zsh-plugins/znap/znap.zsh

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source ohmyzsh/ohmyzsh plugins/sudo