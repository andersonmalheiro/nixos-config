# PLACEHOLDER — replace this entire file with the one generated on YOUR machine.
#
# On a fresh install, run:
#   sudo nixos-generate-config --root /mnt
# and copy the resulting /mnt/etc/nixos/hardware-configuration.nix here.
#
# This file is intentionally machine-specific and is NOT something you should
# hand-write or reuse across different computers — filesystems, UUIDs, and
# kernel modules differ per machine.
#
# If you add a GPU (NVIDIA especially), that config usually lives here or in
# its own modules/system/gpu.nix that you import per-host. See README.md.

{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
}
