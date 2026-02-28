{ ... }:

{
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

    programs.zsh.enable = true;
}