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
  echo ""
  echo "Instaluję pakiety z Brewfile..."
  brew bundle --file="$DOTFILES/src/dot_brew/Brewfile"
}

if [ "$OS" = "Darwin" ]; then
    echo "Witaj w instalatorze .dotfiles dla systemu macOS!"
    echo "Czy chcesz kontynuować? (y/n)"

    read -r response
    if [ "$response" != "y" ]; then
        echo ""
        echo "Instalacja anulowana. Do zobaczenia!"
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

    echo ""
    echo "Instalacja zakończona! Do zobaczenia!"

elif [ "$OS" = "Linux" ]; then
  echo "Witaj w instalatorze .dotfiles dla systemu Linux!"
  echo "Czy chcesz kontynuować? (y/n)"

  read -r response
  if [ "$response" != "y" ]; then
    echo ""
    echo "Instalacja anulowana. Do zobaczenia!"
    exit 1
  fi

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
  link_file "$DOTFILES/src/dot_vscode/settings.json" "$HOME/.config/Code/User/settings.json"

  # Hyprland
  link_file "$DOTFILES/src/dot_hyprland/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
  link_file "$DOTFILES/src/dot_hyprland/hyprland/00-base.conf" "$HOME/.config/hypr/hyprland/00-base.conf"
  link_file "$DOTFILES/src/dot_hyprland/hyprland/10-outputs.conf" "$HOME/.config/hypr/hyprland/10-outputs.conf"
  link_file "$DOTFILES/src/dot_hyprland/hyprland/20-inputs.conf" "$HOME/.config/hypr/hyprland/20-inputs.conf"
  link_file "$DOTFILES/src/dot_hyprland/hyprland/30-keybinds.conf" "$HOME/.config/hypr/hyprland/30-keybinds.conf"
  link_file "$DOTFILES/src/dot_hyprland/hyprland/40-windows.conf" "$HOME/.config/hypr/hyprland/40-windows.conf"
  link_file "$DOTFILES/src/dot_hyprland/hyprland/50-exec.conf" "$HOME/.config/hypr/hyprland/50-exec.conf"
  link_file "$DOTFILES/src/dot_hyprland/hyprland/60-ui.conf" "$HOME/.config/hypr/hyprland/60-ui.conf"

  # Hyprpanel
  link_file "$DOTFILES/src/dot_hyprpanel/config.json" "$HOME/.config/hyprpanel/config.json"
  link_file "$DOTFILES/src/dot_hyprpanel/modules.json" "$HOME/.config/hyprpanel/modules.json"
  link_file "$DOTFILES/src/dot_hyprpanel/modules.scss" "$HOME/.config/hyprpanel/modules.scss"

  # Rofi
  link_file "$DOTFILES/src/dot_rofi/config.rasi" "$HOME/.config/rofi/config.rasi"
  link_file "$DOTFILES/src/dot_rofi/theme.rasi" "$HOME/.config/rofi/theme.rasi"

  # Greetd + ReGreet
  link_file "$DOTFILES/src/dot_greetd_regreet/config.toml" "/etc/greetd/config.toml"
  link_file "$DOTFILES/src/dot_greetd_regreet/hyprland.conf" "/etc/greetd/hyprland.conf"
  link_file "$DOTFILES/src/dot_greetd_regreet/regreet.css" "/etc/greetd/regreet.css"
  link_file "$DOTFILES/src/dot_greetd_regreet/regreet.toml" "/etc/greetd/regreet.toml"

  echo ""
  echo "Instalacja zakończona! Do zobaczenia!"

else
    echo "Implementacja dla systemu: $OS wkrótce..."
fi