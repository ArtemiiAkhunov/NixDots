{ pkgs, ... }:
{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.voidwalker = {
      isNormalUser = true;
      description = "Void Walker";
      extraGroups = [
        "wheel"
        "networkmanager"
        "input"
        "uinput"
        "audio"
      ];
      packages = with pkgs; [ ];
    };
  };
}
