{ pkgs, ... }:

{
  home.file = { ".ssh/id_ed25519.pub".source = ../../keys/id_ed25519.pub; };
}
