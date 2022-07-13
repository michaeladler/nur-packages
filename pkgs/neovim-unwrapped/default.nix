final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "778541067a2f0ec3ef4bc1b07def646323e852a9";
    sha256 = "1nwn1llkfrxc336i4h6bzl3wq4p2vhcca94dpjszvvg0398aiqim";
    fetchSubmodules = true;
  };

})
