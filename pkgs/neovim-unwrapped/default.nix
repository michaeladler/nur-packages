final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-19";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f4d8e992bfcd6e9d0097b9d7a022060bd32f2069";
    sha256 = "156dm40fy29yzvq0sp9n2wf9i8v8yq1va2sx8j5f6aj25nmv43sa";
    fetchSubmodules = true;
  };

})
