final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d529523027c3d3c80c469fa689b0f65ec6f8298e";
    sha256 = "19ka58r7rpwsmpw3qwaxxzfapkgafhbnas01apach5lmmsnlb9h0";
    fetchSubmodules = true;
  };

})
