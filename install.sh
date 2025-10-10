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

install_pacman_yay() {
  echo "Instaluję pakiety z pacman i yay..."
  sudo pacman -Syu --noconfirm < "$DOTFILES/src/dot_arch/pacman_packages.txt"
  yay -Syu --noconfirm - < "$DOTFILES/src/dot_arch/yay_packages.txt"
}

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
    while read -r ext; do
      [[ -n "$ext" ]] && code --no-sandbox --force --install-extension "$ext"
      sleep 0.5
    done < "$HOME/.dotfiles/src/dot_vscode/extensions.txt"
    link_file "$HOME/.dotfiles/src/dot_vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

    # Zsh
    link_file "$HOME/.dotfiles/src/dot_zsh/.zshrc" "$HOME/.zshrc"

elif [ "$OS" = "Linux" ]; then
    echo "Witaj w instalatorze .dotfiles dla systemu Linux"

    # Pacman + Yay
    install_pacman_yay

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
    while read -r ext; do
      [[ -n "$ext" ]] && code --no-sandbox --force --install-extension "$ext"
      sleep 0.5
    done < "$HOME/.dotfiles/src/dot_vscode/extensions.txt"
    link_file "$HOME/.dotfiles/src/dot_vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

    # Zsh
    link_file "$HOME/.dotfiles/src/dot_zsh/.zshrc" "$HOME/.zshrc"

    # Greetd + ReGeet
    sudo cp "$HOME/.dotfiles/src/dot_greetd_regreet/config.toml" "/etc/greetd/config.toml"
    sudo cp "$HOME/.dotfiles/src/dot_greetd_regreet/regreet.toml" "/etc/greetd/regeet.toml" 
    sudo cp "$HOME/.dotfiles/src/dot_greetd_regreet/hyprland.conf" "/etc/greetd/hyprland.conf"
    sudo cp "$HOME/.dotfiles/src/dot_greetd_regreet/regreet.css" "/etc/greetd/regeet.css"
    sudo cp "$HOME/.dotfiles/data/dot_wallpaper/wallpaper_dark.png" "/usr/share/backgrounds/greeter.png"

    # Hyprland
    link_file "$HOME/.dotfiles/src/dot_hyprland/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
    link_file "$HOME/.dotfiles/src/dot_hyprland/hyprland/00-base.conf" "$HOME/.config/hypr/hyprland/00-base.conf"
    link_file "$HOME/.dotfiles/src/dot_hyprland/hyprland/10-outputs.conf" "$HOME/.config/hypr/hyprland/10-outputs.conf"
    link_file "$HOME/.dotfiles/src/dot_hyprland/hyprland/20-inputs.conf" "$HOME/.config/hypr/hyprland/20-inputs.conf"
    link_file "$HOME/.dotfiles/src/dot_hyprland/hyprland/30-keybinds.conf" "$HOME/.config/hypr/hyprland/30-keybinds.conf"
    link_file "$HOME/.dotfiles/src/dot_hyprland/hyprland/40-windows.conf" "$HOME/.config/hypr/hyprland/40-windows.conf"
    link_file "$HOME/.dotfiles/src/dot_hyprland/hyprland/50-exec.conf" "$HOME/.config/hypr/hyprland/50-exec.conf"
    link_file "$HOME/.dotfiles/src/dot_hyprland/hyprland/60-ui.conf" "$HOME/.config/hypr/hyprland/60-ui.conf"

    # Hyprpaper
    link_file "$HOME/.dotfiles/src/dot_hyprpaper/hyprpaper.conf" "$HOME/.config/hypr/hyprpaper.conf"

    #Hyprpanel
    link_file "$HOME/.dotfiles/src/dot_hyprpanel/config.json" "$HOME/.config/hyprpanel/config.json"
    link_file "$HOME/.dotfiles/src/dot_hyprpanel/modules.scss" "$HOME/.config/hyprpanel/modules.scss"
    link_file "$HOME/.dotfiles/src/dot_hyprpanel/modules.json" "$HOME/.config/hyprpanel/modules.json"


    # Rofi
    link_file "$HOME/.dotfiles/src/dot_rofi/config.rasi" "$HOME/.config/rofi/config.rasi"
    link_file "$HOME/.dotfiles/src/dot_rofi/theme.rasi" "$HOME/.config/rofi/theme.rasi"

else
    echo "Nieznany system: $OS"
fi

