{ pkgs, ... }:

{
  home.sessionVariables = { BROWSER = "brave"; };

  programs.brave.enable = true;

  programs.brave.extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb";}
  ];
}
