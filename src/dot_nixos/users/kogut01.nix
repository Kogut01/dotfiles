{ config, pkgs, inputs, ...}:

{
    imports = [
        ../modules/theme.nix
        ../modules/zsh.nix
    ];

	home.username = "kogut01";
	home.homeDirectory = "/home/kogut01";
	home.stateVersion = "25.11";

	home.packages = with pkgs; [
		git

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

		protonup-qt
        gamescope
	];

	home.file.".config/hypr/hyprland".source = ../../dot_hyprland/hyprland;
	home.file.".config/hypr/hyprland.conf".source = ../../dot_hyprland/hyprland.conf;
	home.file.".config/hyprpanel".source = ../../dot_hyprpanel;
	home.file.".config/rofi".source = ../../dot_rofi;

	home.file.".config/ghostty".source = ../../dot_ghostty;
	home.file.".config/nvim".source = ../../dot_nvim;
	home.file.".config/git/ignore".source = ../../dot_git/ignore;
	home.file.".gitconfig".source = ../../dot_git/.gitconfig;
	home.file.".config/bat".source = ../../dot_bat;
	home.file.".config/btop".source = ../../dot_btop;
	home.file.".config/fastfetch".source = ../../dot_fastfetch;

}
