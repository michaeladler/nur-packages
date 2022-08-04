final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-04";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "27ce21ac852cb520740210ba68062e981657b6f4";
    sha256 = "0yb6zyiqal477ppqd36m29jnzwzpq5kfdiy9a0sc06gamcrazccv";
    fetchSubmodules = true;
  };

})
