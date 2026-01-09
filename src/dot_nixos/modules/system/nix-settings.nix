{ pkgs, ... }:

{
    networking.networkmanager.enable = true;
    
    virtualisation.docker = {
        enable = true;
        enableOnBoot = true;
    };

    programs.zsh.enable = true;

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
    };
    
    boot.loader.systemd-boot.configurationLimit = 5;

    nix.settings = {
        auto-optimise-store = true;
        experimental-features = [ "nix-command" "flakes" ];

        sandbox = true;
        builders-use-substitutes = true;
    };

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        stdenv.cc.cc.lib
        zlib
        fuse3
        icu
        nss
        openssl
        curl
        expat
    ];
}