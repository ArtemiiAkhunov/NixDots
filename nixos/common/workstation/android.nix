{ pkgs, ... }:
{
  programs.adb.enable = true;
  users.users.voidwalker.extraGroups = [
    "kvm"
    "abdusers"
  ];
}
