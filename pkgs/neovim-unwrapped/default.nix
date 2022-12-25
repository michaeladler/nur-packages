final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "9be24110f68abc111c87c88d82f50f64a1d3ecdd";
    sha256 = "1kga10npb63zvxzvg2l5cnhp56ly8qlh4nmv6k8f83mz7hcchvvf";
    fetchSubmodules = true;
  };

})
