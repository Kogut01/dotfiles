{ pkgs, lib, ... }:

let
    greetdPath = ../../../dot_greetd_regreet;
    dataPath = ../../../../data;
    cursorPackage = pkgs.dracula-theme;
    cursorName = "Dracula-cursors";
    cursorSize = 24;
in
{
    environment.etc = {
        "greetd/regreet.toml".source = "${greetdPath}/regreet.toml";
        "greetd/regreet.css".source = "${greetdPath}/regreet.css";
        "greetd/hyprland.conf".source = "${greetdPath}/hyprland.conf";
        "greetd/greeter.png".source = "${dataPath}/dot_wallpaper/wallpaper_dark.png";
    };

    environment.systemPackages = [ pkgs.regreet cursorPackage ];

    environment.variables = {
        XCURSOR_THEME = cursorName;
        XCURSOR_SIZE = toString cursorSize;
        XCURSOR_PATH = lib.mkForce "${cursorPackage}/share/icons:$HOME/.icons:$HOME/.local/share/icons";
    };

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.hyprland}/bin/Hyprland --config /etc/greetd/hyprland.conf";
                user = "greeter";
            };
        };
    };

    users.users.greeter.extraGroups = [ "video" "render" ];
}
