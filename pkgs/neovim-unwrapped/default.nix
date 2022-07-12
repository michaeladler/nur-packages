final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "195d8496a03bf5a14f5d114d57d841b037d543c4";
    sha256 = "0763kcnb0119yw6ysld6ahchybncabmnpwdzd3jgsrrdfazd3r37";
    fetchSubmodules = true;
  };

})
