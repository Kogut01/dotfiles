# 🍎 macOS
1. /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
2. eval "$(/opt/homebrew/bin/brew shellenv)"
3. brew install dotbot
4. clone my dotfiles repository
5. go to `dotfiles/src` directory
6. dotbot -c dotbot.macos.yml

# 🐧 Debian
1. sudo apt update
2. sudo apt install -y build-essential procps curl file git
3. /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
4. eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
5. brew install dotbot
6. clone my dotfiles repository
7. go to `dotfiles/src` directory
8. dotbot -c dotbot.debian.yml