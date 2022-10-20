final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-19";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fad558b6affd54075654dd55922348f76a95e338";
    sha256 = "0q745l2dk8vkq4cznqyjppblkbnpqscq5kycxcx6jma9zp3y3nnr";
    fetchSubmodules = true;
  };

})
