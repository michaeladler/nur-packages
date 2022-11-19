final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "db407010facc55c19b5ebdf881225ac39cb29d01";
    sha256 = "0fg26k4jkjvzsi2mnh5v0hr28irj18y0n5cc6qrd14diwq3x84hg";
    fetchSubmodules = true;
  };

})
