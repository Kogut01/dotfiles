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
#   sudo pacman -Syu --needed --noconfirm $(< "$HOME/.dotfiles/src/dot_arch/pacman_packages.txt")
# }

# install_aur_packages() {
#   echo "Instaluję pakiety z aur_packages.txt..."
#   yay -Syu --needed --noconfirm $(< "$HOME/.dotfiles/src/dot_arch/aur_packages.txt")
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

    # Pacman packages
    # install_arch_packages

    # AUR packages
    # install_aur_packages

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

    # Greetd + ReGeet
    sudo cp "$HOME/.dotfiles/src/dot_greetd_regreet/config.toml" "/etc/greetd/config.toml"
    sudo cp "$HOME/.dotfiles/src/dot_greetd_regreet/regeet.toml" "/etc/greetd/regeet.toml" 
    sudo cp "$HOME/.dotfiles/src/dot_greetd_regreet/hyprland.conf" "/etc/greetd/hyprland.conf"
    sudo cp "$HOME/.dotfiles/src/dot_greetd_regreet/regeet.css" "/etc/greetd/regeet.css"

    # Hyprland
    link_file "$HOME/.dotfiles/src/dot_hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
    link_file "$HOME/.dotfiles/src/dot_hypr/hyprland/00-base.conf" "$HOME/.config/hypr/hyprland/00-base.conf"
    link_file "$HOME/.dotfiles/src/dot_hypr/hyprland/10-outputs.conf" "$HOME/.config/hypr/hyprland/10-outputs.conf"
    link_file "$HOME/.dotfiles/src/dot_hypr/hyprland/20-inputs.conf" "$HOME/.config/hypr/hyprland/20-inputs.conf"
    link_file "$HOME/.dotfiles/src/dot_hypr/hyprland/30-keybinds.conf" "$HOME/.config/hypr/hyprland/30-keybinds.conf"
    link_file "$HOME/.dotfiles/src/dot_hypr/hyprland/40-windows.conf" "$HOME/.config/hypr/hyprland/40-windows.conf"
    link_file "$HOME/.dotfiles/src/dot_hypr/hyprland/50-exec.conf" "$HOME/.config/hypr/hyprland/50-exec.conf"
    link_file "$HOME/.dotfiles/src/dot_hypr/hyprland/60-ui.conf" "$HOME/.config/hypr/hyprland/60-ui.conf"

    # Hyprpaper
    link_file "$HOME/.dotfiles/src/dot_hypr/hyprpaper.conf" "$HOME/.config/hypr/hyprpaper.conf"

    # Rofi
    link_file "$HOME/.dotfiles/src/dot_rofi/config.rasi" "$HOME/.config/rofi/config.rasi"
    link_file "$HOME/.dotfiles/src/dot_rofi/theme.rasi" "$HOME/.config/rofi/theme.rasi"

    # Waybar
    link_file "$HOME/.dotfiles/src/dot_waybar/config" "$HOME/.config/waybar/config"
    link_file "$HOME/.dotfiles/src/dot_waybar/style.css" "$HOME/.config/waybar/style.css"
    link_file "$HOME/.dotfiles/src/dot_waybar/scripts/wttr.py" "$HOME/.config/waybar/scripts/wttr.py"
    link_file "$HOME/.dotfiles/src/dot_waybar/scripts/pacman-updates.sh" "$HOME/.config/waybar/scripts/pacman-updates.sh"
    link_file "$HOME/.dotfiles/src/dot_waybar/modules.json" "$HOME/.config/waybar/modules.json"

else
    echo "Nieznany system: $OS"
fi

