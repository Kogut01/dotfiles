{ pkgs, ... }:

{
	home.packages = [ 
	  	pkgs.dracula-theme
	  	pkgs.dracula-icon-theme
	];

	gtk = {
		enable = true;
	
		theme = {
			name = "Dracula";
			package = pkgs.dracula-theme;
		};

		iconTheme = {
			name = "Dracula";
			package = pkgs.dracula-icon-theme;
		};

		cursorTheme = {
			name = "Dracula-Cursors";
			package = pkgs.dracula-theme;
			size = 24;
		};

		gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
		gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
	};

	home.sessionVariables = {
		GTK_THEME = "Dracula";
		XCURSOR_THEME = "Dracula-cursors";
		XCURSOR_SIZE = "24";
	};

	xdg.configFile."gtk-4.0/assets".source = "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/assets";
	xdg.configFile."gtk-4.0/gtk.css".source = "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/gtk.css";
	xdg.configFile."gtk-4.0/gtk-dark.css".source = "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/gtk-dark.css";
}