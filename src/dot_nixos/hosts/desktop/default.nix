{ pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../modules/system/audio.nix
        ../../modules/system/docker.nix
        ../../modules/system/networking.nix
        ../../modules/system/nix-ld.nix
        ../../modules/system/nix-settings.nix
        ../../modules/desktop/fonts.nix
        ../../modules/desktop/gaming.nix
        ../../modules/desktop/greetd.nix
        ../../modules/desktop/hyprland.nix
        ../../modules/hardware/nvidia.nix
    ];

    users.users.kogut01 = {
        isNormalUser = true;
        extraGroups = [ "wheel" "docker"];
        shell = pkgs.zsh;

        description = "Kogut01";
    };

    networking.hostName = "desktop";
    time.timeZone = "Europe/Warsaw";

    i18n.defaultLocale = "pl_PL.UTF-8";

    environment.systemPackages = with pkgs; [
        curl
        wget
        zip
        unzip
        p7zip
        unrar
        ntfs3g
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.editor = false;
    boot.loader.efi.canTouchEfiVariables = true;
    security.rtkit.enable = true;

    services.journald.extraConfig = ''
        Storage=persistent
        SystemMaxUse=500M
    '';

    services.gvfs.enable = true;
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;

    xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
        config = {
            hyprland = {
                default = [ "hyprland" "gtk" ];
                "org.freedesktop.impl.portal.Screenshot" = "hyprland";
                "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
                "org.freedesktop.impl.portal.GlobalShortcuts" = "hyprland";
            };
            common.default = [ "gtk" ];
        };
    };

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "25.11";

    zramSwap = {
        enable = true;
        memoryPercent = 50;
    };

    swapDevices = [{
        device = "/var/lib/swapfile";
        size = 8192;
    }];

    services.earlyoom = {
        enable = true;
        freeMemThreshold = 5;
        freeSwapThreshold = 10;
        enableNotifications = true;
    };

    boot.kernel.sysctl = {
        "kernel.sysrq" = 1;
        "vm.swappiness" = 10;
        "vm.overcommit_memory" = 0;
        "vm.overcommit_ratio" = 80;
        "vm.dirty_ratio" = 10;
        "vm.dirty_background_ratio" = 5;
        "kernel.hung_task_timeout_secs" = 120;
    };
}

