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
        rebuild = "nh os switch ${flakeDir}";
        update = "nix flake update ${flakeDir}";
        
        home-update = "nh home switch ${flakeDir}";

        ll = "ls -al";
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        ssh = "kitten ssh";
        yolo = ''git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'';
        ff = "fastfetch";  
    };
   
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    initExtra = ''
      fastfetch
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "fzf" ];
      theme = "agnoster";
    };
  };
}
