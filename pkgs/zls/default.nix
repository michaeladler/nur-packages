final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2022-01-01";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "08f2638d6ad8da576d235ff2b57935fad08d39f1";
    sha256 = "1850qfxyf6wfbbjzhm05067q89fh381jvnz3brlqjf4y30x1y5df";
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
