{ pkgs, ... }:

let 
  lang = "en_US.UTF-8";
in {
  home.language = {
    address = lang;
    base = lang;
    collate = lang;
    ctype = lang;
    measurement = lang;
    messages = lang;
    monetary = lang;
    name = lang;
    numeric = lang;
    paper = lang;
    telephone = lang;
    time = lang;
  };
}
