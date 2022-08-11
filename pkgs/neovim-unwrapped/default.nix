final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "b4b22318a12a2753a7a8fded60d6850a57d2fa24";
    sha256 = "0gzlx1x9prcrallj8v29jfvyx1c1zwjy86q44mb7qm75ld0n6may";
    fetchSubmodules = true;
  };

})
