{ config, pkgs, ... }:

let
	dotfilesPath = ../..;
in
{
    imports = [
        ../modules/home/theme.nix
        ../modules/home/zsh.nix
    ];

	home.username = "kogut01";
	home.homeDirectory = "/home/kogut01";
	home.stateVersion = "25.11";

	home.packages = with pkgs; [
		git
		rofi
        nautilus
        hyprpanel
        swww
		protonup-ng
        gamescope
        grim
        slurp
        wl-clipboard
        libnotify

		ghostty
        oh-my-posh
        neovim
        bat
        fastfetch
        ranger
        btop
        tree

		vscode
        discord
        spotify
        brave
        heroic
        prismlauncher
        lutris
	];

    home.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
    };

	home.file.".config/hypr/hyprland".source = "${dotfilesPath}/dot_hyprland/hyprland";
	home.file.".config/hypr/hyprland.conf".source = "${dotfilesPath}/dot_hyprland/hyprland.conf";
	home.file.".config/hyprpanel".source = "${dotfilesPath}/dot_hyprpanel";
	home.file.".config/rofi".source = "${dotfilesPath}/dot_rofi";

	home.file.".config/ghostty".source = "${dotfilesPath}/dot_ghostty";
	home.file.".config/nvim".source = "${dotfilesPath}/dot_nvim";
	home.file.".config/git/ignore".source = "${dotfilesPath}/dot_git/ignore";
	home.file.".gitconfig".source = "${dotfilesPath}/dot_git/.gitconfig";
	home.file.".config/bat".source = "${dotfilesPath}/dot_bat";
	home.file.".config/btop".source = "${dotfilesPath}/dot_btop";
	home.file.".config/fastfetch".source = "${dotfilesPath}/dot_fastfetch";
}
