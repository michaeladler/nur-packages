final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-17";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1c4794944deb734b24b4a424c50b766a96e050dd";
    sha256 = "1lf6fsy1jbxhz10d5qc2c5vmz3mb7ppm6n8dg5k8n2kp3bmmw53g";
    fetchSubmodules = true;
  };

})
