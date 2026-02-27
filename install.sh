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
  echo "\nInstaluję pakiety z Brewfile..."
  brew bundle --file="$DOTFILES/src/dot_brew/Brewfile"
}

if [ "$OS" = "Darwin" ]; then
    echo "Witaj w instalatorze .dotfiles dla systemu macOS!"
    echo "Czy chcesz kontynuować? (y/n)"

    read -r response
    if [ "$response" != "y" ]; then
        echo "\nInstalacja anulowana. Do zobaczenia!"
        exit 1
    fi

    # Brew files
    install_brewfile

    # Bat
    link_file "$DOTFILES/src/dot_bat/config" "$HOME/.config/bat/config"

    # Btop
    link_file "$DOTFILES/src/dot_btop/btop.conf" "$HOME/.config/btop/btop.conf"

    # Fastfetch
    link_file "$DOTFILES/src/dot_fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
    link_file "$DOTFILES/src/dot_fastfetch/rooster.txt" "$HOME/.config/fastfetch/rooster.txt"

    # Ghostty
    link_file "$DOTFILES/src/dot_ghostty/config" "$HOME/.config/ghostty/config"

    # Git
    link_file "$DOTFILES/src/dot_git/ignore" "$HOME/.config/git/ignore"
    link_file "$DOTFILES/src/dot_git/.gitconfig" "$HOME/.gitconfig"

    # Neovim
    link_file "$DOTFILES/src/dot_nvim/init.lua" "$HOME/.config/nvim/init.lua"
    link_file "$DOTFILES/src/dot_nvim/lua/plugins/background.lua" "$HOME/.config/nvim/lua/plugins/background.lua"
    link_file "$DOTFILES/src/dot_nvim/lua/config/lazy.lua" "$HOME/.config/nvim/lua/config/lazy.lua"
    link_file "$DOTFILES/src/dot_nvim/lua/config/kogut01.lua" "$HOME/.config/nvim/lua/config/kogut01.lua"

    # Zsh
    link_file "$DOTFILES/src/dot_zsh/.zshrc" "$HOME/.zshrc"

    # VsCode
    while read -r ext; do
      [[ -n "$ext" ]] && code --no-sandbox --force --install-extension "$ext"
      sleep 0.5
    done < "$DOTFILES/src/dot_vscode/extensions.txt"
    link_file "$DOTFILES/src/dot_vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

    echo "\nInstalacja zakończona! Do zobaczenia!"

else
    echo "Implementacja dla systemu: $OS wkrótce..."
fi