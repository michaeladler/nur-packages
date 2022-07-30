final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e59bc078de624a5f3220bfd2713be3f8978c5672";
    sha256 = "079bqykvi206d78hi27fmw5hlg3wbqgk4lkcrqrl7sz719mk3pai";
    fetchSubmodules = true;
  };

})
