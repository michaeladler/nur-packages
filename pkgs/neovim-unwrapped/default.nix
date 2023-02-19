final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-19";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "cbd4480f97a913e0e356ec02f652b693b0195767";
    sha256 = "0bg8hq8cgnbn7klhbrghmizcrka61m06pqs98hlzcndgrx56mzh0";
    fetchSubmodules = true;
  };

})
