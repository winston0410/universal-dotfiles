{ pkgs, ... }:

{
  home.file = { ".ssh/hugosum.pub".source = ../../keys/hugosum.pub; };
}
