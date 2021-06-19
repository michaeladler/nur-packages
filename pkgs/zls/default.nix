final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "2021-06-18";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "bcfd7c6392a05033bc27b3f5d8c232d58d2e3206";
    sha256 = "0sm7lp6a2d7y9pm75gwmf4yl0k76v43wvhpvx6qpyvcbhr6c8b17";
    fetchSubmodules = true;
  };

  dontConfigure = true;
  dontInstall = true;

  buildPhase = ''
    mkdir -p $out
    zig build install -Drelease-safe=true -Ddata_version=master -Dcpu=baseline --prefix $out
  '';

  XDG_CACHE_HOME = ".cache";
})
