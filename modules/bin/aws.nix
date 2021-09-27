{ pkgs, config, ... }:

let xdg = config.xdg;
in {
  home.sessionVariables = {
    AWS_SHARED_CREDENTIALS_FILE = "${xdg.configHome}/aws/credentials";
    AWS_CONFIG_FILE = "${xdg.configHome}/aws/config";
  };
}
