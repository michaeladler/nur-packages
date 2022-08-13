final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e23c5fda0a3fe385af615372c474d4dad3b74464";
    sha256 = "1p0xyfzi5rwv95v1mpis2g2074zq5lrw0a5k3d4ardbkcgca17x4";
    fetchSubmodules = true;
  };

})
