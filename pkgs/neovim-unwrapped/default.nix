final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "bb369a14f3e948c8efa3709d95e4dc2098b2de6a";
    sha256 = "0mjnxhc9bp1xlrr83sk7nn6kcqwwzds645i4rmalg054iaclciiy";
    fetchSubmodules = true;
  };

})
