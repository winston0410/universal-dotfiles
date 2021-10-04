{ pkgs, lib, stdenv, npmlock2nix, ... }:

let
  version = "743f5aafa11d161537bbcd614fe5af81944a8d2f";
  src = pkgs.fetchFromGitHub {
    owner = "winston0410";
    repo = "plugin-pug";
    rev = version;
    sha256 = "sha256-SUH94XnD0a0JX3SQQmHB9SWnS7oVP9BiBcS9a7o4wm0=";
  };
  nodeModules = npmlock2nix.node_modules {
    inherit src;
  };
  nmPath = "${nodeModules + /node_modules}";
in (stdenv.mkDerivation {
  pname = "prettier-plugin-pug";
  inherit version src;
  # Cannot add that to input right now, but I should
  # Got stdenv-linux error
  # > /nix/store/r28nip42zvcr35lsndbgafqa9w4d91n0-stdenv-linux/setup: line 176: $3: unbound variable
  # buildInputs = [ pkgs.nodejs nodeModules];
  buildInputs = [ pkgs.nodejs ];
  buildPhase = ''
     ln -s ${nmPath} ./node_modules
     npm run build
  '';
  installPhase = ''
    mkdir -p $out
    cp -r dist $out
  '';
})
