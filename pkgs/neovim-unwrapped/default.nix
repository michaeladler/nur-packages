final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-03";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fba0562723a1af143c9e9509920d03d8231b8bf7";
    sha256 = "12xr50a7y0gsiwg66aj41ihllc6l5c12an8gh49y58a4kiiix9nc";
    fetchSubmodules = true;
  };

})
