final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
in

{

  plenary-nvim = prev.lua51Packages.plenary-nvim.overrideAttrs (old: rec {
    version = "unstable-2021-08-13";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "0b78fe699b9049b8f46942664027b32102979832";
      sha256 = "16ghyvnsqdrfkjb7hawcvwrx56v6llnq4zziw4z1811j4n1v6ypa";
    };

    knownRockspec = "${src.outPath}/plenary.nvim-scm-1.rockspec";
  });

}
