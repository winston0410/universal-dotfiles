username:
{ pkgs, ... }:

{
  # nixpkgs.overlays = [
    # (self: super: {
      # nixUnstable = super.nixUnstable.override {
        # patches = [ ../../dotfiles/unset-is-macho.patch ];
      # };
    # })
  # ];

  home-manager.users.${username} = {
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      nix-direnv = {
        enable = true;
        enableFlakes = true;
      };
    };
  };
}
