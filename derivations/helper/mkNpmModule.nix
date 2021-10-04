{ pkgs, stdenv, inputs, ... }:

{ pname, src, version }:
let
  npmlock2nix = pkgs.callPackage inputs.npmlock2nix {};
  nodeModules = npmlock2nix.node_modules { inherit src; };
  nmPath = "${nodeModules + /node_modules}";
in (stdenv.mkDerivation {
  inherit pname version src;
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
