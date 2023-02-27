final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "3f042854c8276119d91ee5a8ef07e060b119bf46";
    sha256 = "1xrp89zcvj5j7l47ds3y194izr05lhmxr35m676nhph9p5bmg78k";
    fetchSubmodules = true;
  };

})
