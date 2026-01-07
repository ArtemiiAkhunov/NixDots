{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "nix flake update --flake ~/Dotfiles";

      ll = "ls -al";
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      yolo = ''git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'';

    };

    sessionVariables = {
      MANPAGER = "nvim +Man!";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "fzf"
      ];
      theme = "agnoster";
    };
  };
}
