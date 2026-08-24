{ pkgs, ... }:
{
  fonts.packages =
    with pkgs;
    [
      font-awesome
      fira-code
      inconsolata
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
