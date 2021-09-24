{ pkgs, ... }:

{
  home.sessionVariables = { BROWSER = "brave"; };

  home.packages = with pkgs; [ brave ];
}
