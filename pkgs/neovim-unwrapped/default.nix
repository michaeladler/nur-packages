final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "306e67358377cd17bb20104ec4f8d27619937ad6";
    sha256 = "1qr8xih167gdwdhc6zjimp5i4vhp15k4ay0314rj8r8cmqpc8qww";
    fetchSubmodules = true;
  };

})
