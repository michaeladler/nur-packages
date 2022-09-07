final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "b17c5c3d9c9f51423c3d8c7f76711ad82191bdcf";
    sha256 = "09xmy007g5ibgp4wnkcdph7wx4wrns0pii7pp95rhxg8x14ymkrj";
    fetchSubmodules = true;
  };

})
