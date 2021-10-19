final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
in

{

  plenary-nvim = prev.lua51Packages.plenary-nvim.overrideAttrs (old: rec {
    version = "unstable-2021-10-18";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "901b96d37a30be0504c97cc2c05d3a99b4cca842";
      sha256 = "14nkpj4x9213waqsy93sdgnll42s4dxxpq5kv6g8w015drjrbwhv";
    };

    knownRockspec = "${src.outPath}/plenary.nvim-scm-1.rockspec";
  });

}
