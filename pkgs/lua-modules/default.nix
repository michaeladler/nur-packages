final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
in

{

  plenary-nvim = prev.lua51Packages.plenary-nvim.overrideAttrs (old: rec {
    version = "unstable-2021-10-06";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "80bb2b9bb74bdca38a46480b6f2e15af990406e4";
      sha256 = "11akcpxcp4m997a2y76ajknnmsifac2hj4nq9i4a8b1j08bxinim";
    };

    knownRockspec = "${src.outPath}/plenary.nvim-scm-1.rockspec";
  });

}
