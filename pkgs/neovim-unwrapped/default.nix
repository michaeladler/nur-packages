final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-15";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c752c853630898f38bcf46a9a5e9d83e41989eeb";
    sha256 = "03f5c7l75icwaj8nisbqa93l8v4fx5rq0jw23yi8k02lcwlaknrx";
    fetchSubmodules = true;
  };

})
