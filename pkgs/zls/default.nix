final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-10-26";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "80f09831bc4be779af8a1bf8fadda1357faa302e";
    sha256 = "07lgpssarsgms0cycfli503h26zk2s1j7hsg341219ih0k9namf4";
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
