final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ae5980ec797381cbaee7398a656bdb233f951981";
    sha256 = "1ixnc90j7ysjd7x1gd3bgr8zq9hgy7qv783pazv6qfdkvyx45j64";
    fetchSubmodules = true;
  };

})
