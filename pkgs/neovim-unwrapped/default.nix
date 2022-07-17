final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-17";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "4f59bc8013a631f3bed70fb8a313e985818073f0";
    sha256 = "1j6jbb2jy52bx1gsmglc5m2njspv7yzxmn5r3j10dwv6lim1vfy5";
    fetchSubmodules = true;
  };

})
