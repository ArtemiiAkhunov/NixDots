{ pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    signing = {
      key = "A59548A0FB3DEC67B157E7471C21E057641FA4AC";
      signByDefault = lib.mkDefault true;
    };
    settings = {
      push.autoSetupRemote = "true";
      init.defaultBranch = "main";
      pull.rebase = "true";
      credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
      user = {
        name = "ArtemiiAkhunov";
        email = "artemii13052003@gmail.com";
      };
    };
  };
}
