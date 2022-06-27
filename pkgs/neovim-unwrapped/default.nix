final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a0a815ec57ec241bd9d7db139eb2591bf5ef24ac";
    sha256 = "09fwhkmmhacidwa6v3pp9j3hk7x65ip3vxl94jd9ascah9mc21p7";
    fetchSubmodules = true;
  };

})
