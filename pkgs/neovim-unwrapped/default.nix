final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-01";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "adda751407df6d9fcb9f2cf1dade0c713924e20a";
    sha256 = "1d8sy4n1v8s3nkgiax4i3g93l99zgqlivvhnw9d50g0j2li596xz";
    fetchSubmodules = true;
  };

})
