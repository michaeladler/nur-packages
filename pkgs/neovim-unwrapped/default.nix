final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "98daaa798e018071876d026a60840991be8d8069";
    sha256 = "1kcmlkfxc394b8man4pm9i8vh940ajr3mvj0fbr1qdm8x4x8d55w";
    fetchSubmodules = true;
  };

})
