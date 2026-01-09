{ pkgs, ... }:

let
    greetdPath = ../../../dot_greetd_regreet;
    dataPath = ../../../../data;
in
{
    environment.etc = {
        "greetd/regreet.toml".source = "${greetdPath}/regreet.toml";
        "greetd/regreet.css".source = "${greetdPath}/regreet.css";
        "greetd/hyprland.conf".source = "${greetdPath}/hyprland.conf";
        "/usr/share/backgrounds/greeter.png".source = "${dataPath}/dot_wallpaper/wallpaper_dark.png";
    };

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.hyprland}/bin/hyprland --config /etc/greetd/hyprland.conf";
                user = "greeter";
            };
        };
    };

    users.extraUsers.greeter.extraGroups = [ "video" "render" ];
}
