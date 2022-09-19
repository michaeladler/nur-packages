final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "647da34bbd4cf19a4bcc11899df24e00d6b8fcbe";
    sha256 = "114p1548248sibq0ndnppavng98pa3mkxwyqkwgcnmp1nb38qdyz";
    fetchSubmodules = true;
  };

})
