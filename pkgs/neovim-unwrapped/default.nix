final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-05";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "759259e8af2f6f5e840fcbd687caaaf5f2b9b676";
    sha256 = "0dq111svc97azqcnq1zhhks7lnqlpcpwpa3n2lczvz88hbda34ml";
    fetchSubmodules = true;
  };

})
