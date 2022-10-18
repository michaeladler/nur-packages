final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "bd7ca10fdd762f8846dc0ef9db0a723bb8f3610a";
    sha256 = "05xzz646nbxwn5vqmf0hh6q7f99r0cjjylllz3nmn5vy6h11dj8z";
    fetchSubmodules = true;
  };

})
