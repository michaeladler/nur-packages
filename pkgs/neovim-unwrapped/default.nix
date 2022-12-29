final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "05b6dd6e5f543083ebca581506398a8c263a2db6";
    sha256 = "0052zgjvb059v0zs0rp98kzg762z5n7aw4h4ijpmbz6gn63wiqy7";
    fetchSubmodules = true;
  };

})
