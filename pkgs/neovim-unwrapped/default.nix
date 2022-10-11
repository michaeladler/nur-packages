final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "8f0b94b36d4d6687712ccfc525284f1fac58d2f6";
    sha256 = "03psqg01xqyvsm9w82ch09pwhgyndykw7f14sfppzp42ffpk1zrf";
    fetchSubmodules = true;
  };

})
