final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-12-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "8744ee8783a8597f9fce4a573ae05aca2f412120"; # tags/*
    sha256 = "1j3z7jay0m6g06v04falrzr062g07xr4svbrc3hywlqi2h6rrvk5";
    fetchSubmodules = true;
  };

  patches = [ ];

})
