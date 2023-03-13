final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "5aec6114693dea442023857e071bf6f90c8c109a";
    sha256 = "1nbx8a5hhbsb5n3l8jv105zv1rlab4p27frwap9v64mbaqh1vwjy";
    fetchSubmodules = true;
  };

})
