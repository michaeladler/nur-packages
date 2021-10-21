final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-10-19";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "088dc570de3870ababd35a94ac67b0f60c61361b";
    sha256 = "1wc5l4zfnga01hq7flycdaz2vn2w4kkzncjc063mvaxgw7zbbp0c";
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
