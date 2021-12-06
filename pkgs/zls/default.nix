final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-12-03";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "5fd35f7efebe3b8e3a77c3f184b6c51dd77f1312";
    sha256 = "07qjnb9la51i9mmz387xgpy8nn86qdcf8v635d6xmggcjc6r63dc";
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
