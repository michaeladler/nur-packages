{ sources, callPackage, config, lib, vimUtils, vim }:

let

  inherit (vimUtils.override {inherit vim;}) buildVimPluginFrom2Nix;

  inherit (lib) extends;

  initialPackages = self: {};

  plugins = callPackage ./generated.nix {
    inherit sources buildVimPluginFrom2Nix;
  };

  # TL;DR
  # * Add your plugin to ./vim-plugin-names
  # * run ./update.py
  #
  # If additional modifications to the build process are required,
  # add to ./overrides.nix.
  overrides = callPackage ./overrides.nix {
    inherit buildVimPluginFrom2Nix;
  };

  aliases = final: prev: {};

  extensible-self = lib.makeExtensible
    (extends aliases
      (extends overrides
        (extends plugins initialPackages)
      )
    );
in
  extensible-self
