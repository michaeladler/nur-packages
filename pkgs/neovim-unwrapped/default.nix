final: prev: sources:

let mysource = sources.neovim; in

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "nightly-${builtins.substring 0 7 mysource.rev}";

  src = prev.fetchFromGitHub {
    inherit (mysource) owner repo rev sha256;
  };

})
