final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "7718241286315a8099427d42cb83c6532d87a390";
    sha256 = "03xsa1jbjx1h2rfifbm4fi356scl80ldip73lgayyf2s9xmxb5k9";
    fetchSubmodules = true;
  };

})
