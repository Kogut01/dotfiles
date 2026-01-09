{ config, pkgs, lib, inputs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../modules/system/audio.nix
        ../../modules/desktop/fonts.nix
        ../../modules/desktop/gaming.nix
        ../../modules/desktop/greetd.nix
        ../../modules/desktop/hyprland.nix
        ../../modules/hardware/nvidia.nix
        ../../modules/system/nix-settings.nix
    ];

    users.users.kogut01 = {
        isNormalUser = true;
        extraGroups = [ "wheel" "docker"];
        shell = pkgs.zsh;

        description = "Kogut01";
    };

    networking.hostName = "desktop";
    time.timeZone = "Europe/Warsaw";

    environment.systemPackages = with pkgs; [
        regreet
        wget
        zip
        unzip
        p7zip
        unrar
        ntfs3g
        dracula-theme
        dracula-icon-theme
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    security.rtkit.enable = true;

    services.gvfs.enable = true;
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;

    xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
        config.common.default = "*";
    };

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.11";
}

