{ config, pkgs, ... }:

{
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.production;
        nvidiaPersistenced = true;
    };

    boot.kernelParams = [
        "nvidia-drm.fbdev=1"
    ];

    environment.systemPackages = with pkgs; [
        vulkan-tools
        vulkan-loader
        mesa
    ];

    environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "nvidia";
        GBM_BACKEND = "nvidia-drm";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";

        VK_DRIVER_FILES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json:/run/opengl-driver-32/share/vulkan/icd.d/nvidia_icd.i686.json";

        __GL_SHADER_DISK_CACHE = "1";
        __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
    };
}