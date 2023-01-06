final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-05";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "08ebf8d3a80c65b01d493ca84ad2ab7304a669f9";
    sha256 = "1im25cfq61dbm994s3l7m3xp0nd9k19jgarljdmgnkpypwqb6r7r";
    fetchSubmodules = true;
  };

})
