final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "06aed7c1776e9db769c77ce836c1995128a6afc6";
    sha256 = "1vxq5a9z4gchkg9lg7wflbqs80yr4nhr151bmhfqhgh84xrrnb7f";
    fetchSubmodules = true;
  };

})
