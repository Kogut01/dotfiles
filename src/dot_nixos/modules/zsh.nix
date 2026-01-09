{ config, pkgs, ... }:

{
	programs.zsh = {
		enable = true;

		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		enableCompletion = true;

		shellAliases = {
			grep = "grep --color=auto";
			ls = "ls --color=auto";
			la = "ls -laF --color=auto";
			vi = "nvim";
			ff = "fastfetch";
			nrsd = "sudo nixos-rebuild switch --flake .#desktop";
			nrss = "sudo nixos-rebuild switch --flake .#server";
		};

		localVariables = {
			LANG = "pl_PL.UTF-8";
			EDITOR = "nvim";
			TERM = "xterm-256color";
			COLORTERM = "truecolor";
			TERM_PROGRAM = "ghostty";
		};

		oh-my-zsh = {
			enable = true;
			plugins = [ "git" "sudo" "colored-man-pages" ];
		};

		initContent = ''
			export PATH="$HOME/.local/bin:$PATH"

			eval "$(oh-my-posh init zsh --config ~/.dotfiles/data/dot_themes/zsh_theme.omp.json)"
		'';

	};
}