{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = 
      let
        flakeDir = "~/Dotfiles";
      in {
        rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
        update = "nix flake update ${flakeDir}";
        upgrade = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
        
        home-manager-update = "home-manager switch --flake ${flakeDir}";

        ll = "ls -al";
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        z = "zellij";
        ssh = "kitten ssh";
        yolo = ''git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'';
      };
   
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "fzf" ];
      theme = "agnoster";
    };
  };
}
