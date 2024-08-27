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
      # >>> conda initialize >>>
      # !! Contents within this block are managed by 'conda init' !!
      __conda_setup="$('/home/voidwalker/.conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__conda_setup"
      else
          if [ -f "/home/voidwalker/.conda/etc/profile.d/conda.sh" ]; then
              . "/home/voidwalker/.conda/etc/profile.d/conda.sh"
          else
              export PATH="/home/voidwalker/.conda/bin:$PATH"
          fi
      fi
      unset __conda_setup
      # <<< conda initialize <<<
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "fzf" ];
      theme = "agnoster";
    };
  };
}
