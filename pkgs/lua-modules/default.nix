final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
in

{

  plenary-nvim = prev.lua51Packages.plenary-nvim.overrideAttrs (old: rec {
    version = "unstable-2021-10-21";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "de5acdcb595f0a97bec874693008c94f94b57060";
      sha256 = "1g0j2nnmnfkmbirpqg751pl1qxrbx6fx39r9ak0f7sl9rm8322s7";
    };

    knownRockspec = "${src.outPath}/plenary.nvim-scm-1.rockspec";
  });

}
