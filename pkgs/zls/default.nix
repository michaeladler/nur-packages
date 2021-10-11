final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-10-11";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "44fb88b85b2a5a6d74e9c40ac868f824c46c4174";
    sha256 = "0jhj7b0klbvlrrkigmm44dyxf5bgpcqhiin879psr1402w9wcml5";
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
