final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ffd216e869fd7c18b9f608173c929500e26fe070";
    sha256 = "1qnjjv6wjnmr1d3v0vm0kjss7v6n8d7ji0r27vzc17i1jcaclps5";
    fetchSubmodules = true;
  };

})
