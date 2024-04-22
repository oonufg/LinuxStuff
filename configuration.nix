# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./modules/integration.nix
      ./packages.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "knife";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Moscow";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "23.11";
}

