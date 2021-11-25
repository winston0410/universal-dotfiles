{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dhall
    checkmake
    golint
    goimports
    # 2.7.0 is marked broken
    # hadolint
    shellcheck
    python39Packages.flake8
    python39Packages.yamllint
    cpplint
    clippy
    nodePackages.eslint_d
    nodePackages.svelte-check
    ktlint
    nodePackages.jsonlint
  ];
}
