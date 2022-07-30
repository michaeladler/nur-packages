final: prev:

prev.ccls.overrideAttrs (old: {
  version = "unstable-2022-04-16";

  src = prev.fetchFromGitHub {
    owner = "MaskRay";
    repo = "ccls";
    rev = "74458915b3472b0df26264d7d1599505385cf453"; # tags/*
    sha256 = "0cp534n7afl0rrr778cc0bnd8w091qmyqdpp5k1jh4wxla9s09br";
  };

})
