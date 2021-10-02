{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.packages = with pkgs; [
    # For unknown reason it cant be built
    # cmake-language-server
    rust-analyzer
    gopls
    rnix-lsp
    ccls
    # cannot be built
    # haskell-language-server
    beamPackages.elixir_ls
    # cannot be built
    # nodePackages.purescript-language-server
    nodePackages.bash-language-server
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.yaml-language-server
    nodePackages.vls
    nodePackages.vim-language-server
    nodePackages.typescript-language-server
    nodePackages.pyright
    nodePackages.svelte-language-server
    haskellPackages.dhall-lsp-server
    sumneko-lua-language-server
    (buildGoModule rec {
      pname = "sqls";
      version = "0.2.18";
      src = fetchFromGitHub {
        owner = "lighttiger2505";
        repo = "sqls";
        rev = "v${version}";
        sha256 = "13837v27avdp2nls3vyy7ml12nj7rxragchwf92adn10ffp4aj6c";
      };
      vendorSha256 = "1rrnvvpx07q49kshib413b5y5l3icb3na4vmccb4arf5awck14db";
    })
    (buildGoModule rec {
      pname = "efm-langserver";
      version = "0.0.31";
      src = fetchFromGitHub {
        owner = "mattn";
        repo = "efm-langserver";
        rev = "v${version}";
        sha256 = "183vm65wb7byijy9i9ng48ky4ajk9czlz5zsfk4sg5igdkwl7mz0";
      };
      vendorSha256 = "1whifjmdl72kkcb22h9b1zadsrc80prrjiyvyba2n5vb4kavximm";
    })
    terraform-ls
    solargraph
    metals
    nodePackages.vscode-langservers-extracted
    # nodePackages.graphql-language-service-cli
    # nodePackages."@angular/language-server"
    # nodePackages."@prisma/language-server"
  ];

  xdg.configFile = {
    "solargraph/config.yml" = {
      source = ../../dotfiles/solargraph/config.yml;
    };
  };
}
