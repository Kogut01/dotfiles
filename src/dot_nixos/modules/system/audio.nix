{ pkgs, ... }:

{
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        wireplumber = {
            enable = true;
            configPackages = [
                (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/50-disable-bluez.conf" ''
                    wireplumber.profiles = {
                        main = {
                            hardware.bluetooth = disabled
                        }
                    }
                '')
            ];
        };
    };

    environment.systemPackages = with pkgs; [
        pavucontrol
        pamixer
    ];
}