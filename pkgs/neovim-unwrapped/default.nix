final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "4703e561d5bc0eef13da171c4f8f8b6e02ae4883";
    sha256 = "03lnslbdwqgg199y0cw00plrj8cm6106bq1gkrfnp0i5lja7ncws";
    fetchSubmodules = true;
  };

})
