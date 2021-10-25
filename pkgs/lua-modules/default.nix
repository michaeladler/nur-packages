final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
in

{

  plenary-nvim = prev.lua51Packages.plenary-nvim.overrideAttrs (old: rec {
    version = "unstable-2021-10-24";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "b8c8d23c453b73856a4857da8f35a9219c8b0ba0";
      sha256 = "1vnlq4xhpl30zmm3qawz21bs2ndn7qfizn9s011yqc76jbnk5w89";
    };

    knownRockspec = "${src.outPath}/plenary.nvim-scm-1.rockspec";
  });

}
