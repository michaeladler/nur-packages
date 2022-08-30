final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "7a9b5937966d3db852c84b8eb232e77d92d3c355"; # pin
    sha256 = "1x9lvhyhs6zphv0k0mvnv5rnhijss2zasaim4b18k1y9biqb8g3b";
    fetchSubmodules = true;
  };

})
