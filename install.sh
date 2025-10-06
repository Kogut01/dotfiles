DOTFILES="$HOME/.dotfiles"
OS="$(uname)"

link_file() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"
  ln -sf "$src" "$dest"

  echo "Linked $src -> $dest"
}

install_brewfile() {
  echo "Instaluję pakiety z Brewfile..."
  brew bundle --file="$DOTFILES/src/dot_brew/Brewfile"
}

# install_arch_packages() {
#   echo "Instaluję pakiety z pacman_packages.txt..."
#   xargs -a "$DOTFILES/src/dot_arch/pacman_packages.txt" sudo pacman -S --noconfirm
# }


if [ "$OS" = "Darwin" ]; then
    echo "Witaj w instalatorze .dotfiles dla systemu macOS"

    # Brew files
    install_brewfile

    # Bat
    link_file "$HOME/.dotfiles/src/dot_bat/config" "$HOME/.config/bat/config"

    # Btop
    link_file "$HOME/.dotfiles/src/dot_btop/btop.conf" "$HOME/.config/btop/btop.conf"

    # Fastfetch
    link_file "$HOME/.dotfiles/src/dot_fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
    link_file "$HOME/.dotfiles/src/dot_fastfetch/rooster.txt" "$HOME/.config/fastfetch/rooster.txt"

    # Ghostty
    link_file "$HOME/.dotfiles/src/dot_ghostty/config" "$HOME/.config/ghostty/config"

    # Git
    link_file "$HOME/.dotfiles/src/dot_git/ignore" "$HOME/.config/git/ignore"
    link_file "$HOME/.dotfiles/src/dot_git/.gitconfig" "$HOME/.gitconfig"

    # Neovim
    link_file "$HOME/.dotfiles/src/dot_nvim/init.lua" "$HOME/.config/nvim/init.lua"
    link_file "$HOME/.dotfiles/src/dot_nvim/lua/plugins/background.lua" "$HOME/.config/nvim/lua/plugins/background.lua"
    link_file "$HOME/.dotfiles/src/dot_nvim/lua/config/lazy.lua" "$HOME/.config/nvim/lua/config/lazy.lua"
    link_file "$HOME/.dotfiles/src/dot_nvim/lua/config/kogut01.lua" "$HOME/.config/nvim/lua/config/kogut01.lua"

    # VsCode
    xargs -n 1 code --install-extension < "$HOME/.dotfiles/src/dot_vscode/extensions.txt"
    link_file "$HOME/.dotfiles/src/dot_vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

    # Zsh
    link_file "$HOME/.dotfiles/src/dot_zsh/.zshrc" "$HOME/.zshrc"

elif [ "$OS" = "Linux" ]; then
    echo "Witaj w instalatorze .dotfiles dla systemu Linux"

    # Bat
    link_file "$HOME/.dotfiles/src/dot_bat/config" "$HOME/.config/bat/config"

    # Btop
    link_file "$HOME/.dotfiles/src/dot_btop/btop.conf" "$HOME/.config/btop/btop.conf"
    
    # Fastfetch
    link_file "$HOME/.dotfiles/src/dot_fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
    link_file "$HOME/.dotfiles/src/dot_fastfetch/rooster.txt" "$HOME/.config/fastfetch/rooster.txt"

    # Ghostty
    link_file "$HOME/.dotfiles/src/dot_ghostty/config" "$HOME/.config/ghostty/config"

    # Git
    link_file "$HOME/.dotfiles/src/dot_git/ignore" "$HOME/.config/git/ignore"
    link_file "$HOME/.dotfiles/src/dot_git/.gitconfig" "$HOME/.gitconfig"

    # Neovim
    link_file "$HOME/.dotfiles/src/dot_nvim/init.lua" "$HOME/.config/nvim/init.lua"
    link_file "$HOME/.dotfiles/src/dot_nvim/lua/plugins/background.lua" "$HOME/.config/nvim/lua/plugins/background.lua"
    link_file "$HOME/.dotfiles/src/dot_nvim/lua/config/lazy.lua" "$HOME/.config/nvim/lua/config/lazy.lua"
    link_file "$HOME/.dotfiles/src/dot_nvim/lua/config/kogut01.lua" "$HOME/.config/nvim/lua/config/kogut01.lua"

    # VsCode
    xargs -n 1 code --install-extension < "$HOME/.dotfiles/src/dot_vscode/extensions.txt"
    link_file "$HOME/.dotfiles/src/dot_vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

    # Zsh
    link_file "$HOME/.dotfiles/src/dot_zsh/.zshrc" "$HOME/.zshrc"

else
    echo "Nieznany system: $OS"
fi

