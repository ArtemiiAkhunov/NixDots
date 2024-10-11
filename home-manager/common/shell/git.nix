{ pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    userName = "ArtemiiAkhunov";
    userEmail = "artemii13052003@gmail.com";
    signing = {
      key = "A59548A0FB3DEC67B157E7471C21E057641FA4AC";
      signByDefault = lib.mkDefault true;
    };
    extraConfig = {
      push.autoSetupRemote = "true";
      init.defaultBranch = "main";
      pull.rebase = "true";
      credential.helper = "${pkgs.gitAndTools.gitFull}/bin/git-credential-libsecret";
    };
  };
}
