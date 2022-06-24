final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a9cb0b8a5a22fe0488f38ad67818111c7765f9d7";
    sha256 = "0xg0zfr4dv35ax5gpjrbiwyg7kghmrvp17zv4g0904x74gryq21y";
    fetchSubmodules = true;
  };

})
