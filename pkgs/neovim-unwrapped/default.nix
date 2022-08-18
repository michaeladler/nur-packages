final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "02e9b5a8eeaf2a4696dd68ab21b33b9fa7bd6a16";
    sha256 = "1fwv5lnwshnr8swx224dcvqnxsdaij5knd06vkwpgalk9izv8cm5";
    fetchSubmodules = true;
  };

})
