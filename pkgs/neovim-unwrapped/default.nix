final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "282cbc2350986c3fc1edb507c4facc8d8fe8cd97";
    sha256 = "1q3cfskakaln9vf2rh5v59pq61mrp6q1cwhlxb5pl8w75cw09nq6";
    fetchSubmodules = true;
  };

})
