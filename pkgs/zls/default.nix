final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-09-10";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "c5414796a49dd5115a3ec398ed6ce6363ac6a8c8";
    sha256 = "126hh6rhyzkkk5ib9v8dq6114zzvklhnwnv2ca9zrybjrbf2wpp3";
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
