final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-15";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fa7e1e26019112ff9e2ea42626995f04e2a4e032";
    sha256 = "15d1qmdsbvdkm0sxvb5qghb2fksv8y5hby8qcgq9rsqx82y3305k";
    fetchSubmodules = true;
  };

})
