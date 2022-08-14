final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-14";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "5854103dad5a9ae513c089a514364eff55582fbb";
    sha256 = "0w29j4nl6jsxyjyhn4i3j6mqywmq6f59jsnj7s9sc0mgq068564p";
    fetchSubmodules = true;
  };

})
