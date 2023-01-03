final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-03";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "4dd793a256fefb481159f9f93bf7572391e266de";
    sha256 = "1w6l164j0ifjyiaqr526sjsqykwmh1s01a4a6ap1846c8bmzg4sn";
    fetchSubmodules = true;
  };

})
