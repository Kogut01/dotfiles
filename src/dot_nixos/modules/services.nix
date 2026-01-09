{ config, pkgs, ... }:

{
    networking.networkmanager.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        wireplumber.enable = true;
    };
    
    programs.zsh.enable = true;
    virtualisation.docker.enable = true;

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
}