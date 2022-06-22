final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "04592759faa1ca34ceef6ee952f2f243e132d476";
    sha256 = "1f8hdjc64chmv4sr77ir76rzvs2bav6m0h7fc442nca67g1x6vdb";
    fetchSubmodules = true;
  };

})
