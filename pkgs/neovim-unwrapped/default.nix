final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "542fa8a9cc10abb8eddab25a19844d19b94f53c1";
    sha256 = "0bv2kp5ybx6jkridiiww9gr5h44xbxi0964fvx5ghg2izxidnrrl";
    fetchSubmodules = true;
  };

})
