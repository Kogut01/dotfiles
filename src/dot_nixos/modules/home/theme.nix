{ pkgs, ... }:

let
	cursorTheme = "Dracula-cursors";
	cursorPackage = pkgs.dracula-theme;
	cursorSize = 24;
	gtkTheme = "Dracula";
in
{
	home.packages = [ 
	  	cursorPackage
	  	pkgs.dracula-icon-theme
	];

	gtk = {
		enable = true;
	
		theme = {
			name = gtkTheme;
			package = cursorPackage;
		};

		iconTheme = {
			name = "Dracula";
			package = pkgs.dracula-icon-theme;
		};

		cursorTheme = {
			name = cursorTheme;
			package = cursorPackage;
			size = cursorSize;
		};

		gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
		gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
	};

	home.sessionVariables = {
		GTK_THEME = gtkTheme;
		XCURSOR_THEME = cursorTheme;
		XCURSOR_SIZE = toString cursorSize;
	};

	xdg.configFile."gtk-4.0/assets".source = "${cursorPackage}/share/themes/${gtkTheme}/gtk-4.0/assets";
	xdg.configFile."gtk-4.0/gtk.css".source = "${cursorPackage}/share/themes/${gtkTheme}/gtk-4.0/gtk.css";
	xdg.configFile."gtk-4.0/gtk-dark.css".source = "${cursorPackage}/share/themes/${gtkTheme}/gtk-4.0/gtk-dark.css";
}