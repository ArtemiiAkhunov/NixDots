{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = 
      let
        flakeDir = "~/.dotfiles";
      in {
        rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
        update = "nix flake update ${flakeDir}";
        upgrade = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
        
        home-manager-update = "home-manager switch --flake ${flakeDir}";

        ll = "ls -al";
        ls = "ls --color=auto";
        grep = "grep --color=auto";
        ssh = "kitten ssh";
        byobu = "byobu-screen";
      };
   
    envExtra = "fastfetch";
    
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster";
    };
  };
}
