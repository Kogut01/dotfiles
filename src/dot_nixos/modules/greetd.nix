{ config, pkgs, lib, ... }:

{
    environment.etc = {
        "greetd/regreet.toml".source = ../../dot_greetd_regreet/regreet.toml;
        "greetd/regreet.css".source = ../../dot_greetd_regreet/regreet.css;
        "greetd/hyprland.conf".source = ../../dot_greetd_regreet/hyprland.conf;
        "/usr/share/backgrounds/greeter.png".source = ../../../data/dot_wallpaper/wallpaper_dark.png;
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