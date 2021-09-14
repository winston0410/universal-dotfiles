modules: {
  user = let
    devBinariesMinimal = [ modules.bin.essential ];

    devGuiMinimal = [ modules.gui.brave ];

    devServiceMinimal = [ modules.service.nixos.lorri ];

    containerMinimal = [ modules.service.nixos.docker ];
  in rec {
    devBinaries = devBinariesMinimal ++ [
      modules.bin.lsp
      modules.bin.linter
      modules.bin.formatter
      modules.bin.compiler
    ];

    devGui = devGuiMinimal ++ [ modules.gui.insomnia ];

    devService = devServiceMinimal ++ [ ];

    container = containerMinimal ++ [ modules.service.nixos.k8s ];

    devMachine = devBinaries ++ devGui ++ devService ++ container;
  };

  # Only for nixos or nix-darwin
  system = {
    guiSystemMinimal = [ modules.nixos.config.minimal modules.nixos.xserver ];
  };
}
