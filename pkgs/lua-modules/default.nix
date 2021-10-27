final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
in

{

  plenary-nvim = prev.lua51Packages.plenary-nvim.overrideAttrs (old: rec {
    version = "unstable-2021-10-26";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "ef54bc2282a49349238da6c08483ce0c0b769d9f";
      sha256 = "01xn3ly1xdqdgf3wl4j6r3ysn8xbbjl0vmh1wmkx0sjawwd1bjp5";
    };

    knownRockspec = "${src.outPath}/plenary.nvim-scm-1.rockspec";
  });

}
