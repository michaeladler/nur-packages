{ orig, fetchFromGitHub }:

orig.overrideAttrs (oa: {
  version = "2021-05-29";

  src = fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-syntax-highlighting";
    rev = "0e1bb14452e3fc66dcc81531212e1061e02c1a61";
    sha256 = "13nzmkljmzkjh85phby2d8ni7x0fs0ggnii51vsbngkbqqzxs6zb";
    fetchSubmodules = true;
  };

})
