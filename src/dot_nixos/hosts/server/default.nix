# Implementation soon.
{ lib, modulesPath, ... }:

{
    imports = [
        (modulesPath + "/profiles/minimal.nix")
    ];

    boot.loader.grub.devices = [ "nodev" ];
    fileSystems."/" = { device = "/dev/null"; fsType = "ext4"; };

    system.stateVersion = "25.11";
}