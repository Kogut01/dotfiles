DOTFILES="$HOME/.dotfiles"
OS="$(uname)"

link_file() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"
  ln -sf "$src" "$dest"

  echo "Linked $src -> $dest"
}
if [ "$OS" = "Darwin" ]; then
    echo "Witaj w instalatorze .dotfiles dla systemu macOS"

    link_file "$HOME/.dotfiles/src/dot_fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
    link_file "$HOME/.dotfiles/src/dot_fastfetch/rooster.txt" "$HOME/.config/fastfetch/rooster.txt"
    link_file "$HOME/.dotfiles/src/dot_ghostty/config" "$HOME/.config/ghostty/config"
    link_file "$HOME/.dotfiles/src/dot_git/ignore" "$HOME/.config/git/ignore"
    link_file "$HOME/.dotfiles/src/dot_git/.gitconfig" "$HOME/.gitconfig"
    link_file "$HOME/.dotfiles/src/dot_nvim/init.lua" "$HOME/.config/nvim/init.lua"
    link_file "$HOME/.dotfiles/src/dot_zsh/.zshrc" "$HOME/.zshrc"

elif [ "$OS" = "Linux" ]; then
    echo "Witaj w instalatorze .dotfiles dla systemu Linux"
    
    link_file "$HOME/.dotfiles/src/dot_fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
    link_file "$HOME/.dotfiles/src/dot_fastfetch/rooster.txt" "$HOME/.config/fastfetch/rooster.txt"
    link_file "$HOME/.dotfiles/src/dot_ghostty/config" "$HOME/.config/ghostty/config"
    link_file "$HOME/.dotfiles/src/dot_git/ignore" "$HOME/.config/git/ignore"
    link_file "$HOME/.dotfiles/src/dot_git/.gitconfig" "$HOME/.gitconfig"
    link_file "$HOME/.dotfiles/src/dot_nvim/init.lua" "$HOME/.config/nvim/init.lua"
    link_file "$HOME/.dotfiles/src/dot_zsh/.zshrc" "$HOME/.zshrc"

else
    echo "Nieznany system: $OS"
fi

