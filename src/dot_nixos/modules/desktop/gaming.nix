{ pkgs, ...}:

{
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        gamescopeSession.enable = true;

        extraPackages = with pkgs; [
            vulkan-loader
            vulkan-tools

            gamescope
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
    };

    programs.gamemode.enable = true;

    programs.gamescope = {
        enable = true;
        capSysNice = true;
    };

    environment.systemPackages = with pkgs; [
        wine64
        winetricks
    ];
}