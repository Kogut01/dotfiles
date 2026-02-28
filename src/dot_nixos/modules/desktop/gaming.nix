{ pkgs, ...}:

{
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        gamescopeSession.enable = true;
        protontricks.enable = true;

        extraPackages = with pkgs; [
            vulkan-loader
            vulkan-tools
            gamescope
            mangohud
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            libkrb5
            keyutils
        ];

        extraCompatPackages = with pkgs; [
            proton-ge-bin
        ];
    };

    programs.gamemode.enable = true;

    programs.gamescope = {
        enable = true;
        capSysNice = true;
    };

    hardware.steam-hardware.enable = true;

    environment.systemPackages = with pkgs; [
        mangohud
        wine64
        winetricks
    ];
}