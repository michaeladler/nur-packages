final: prev:

prev.dwm.overrideAttrs (old: {
  version = "2021-07-04";

  src = prev.fetchFromGitHub {
    owner = "LukeSmithxyz";
    repo = "dwm";
    rev = "80109dbd85342d2764d8a0d18fb32b79aebc9966";
    sha256 = "0sad60ak3h02q20hmqqcpblzx6q94z4ig07vsx6gdmc830al6bqx";
  };

})
