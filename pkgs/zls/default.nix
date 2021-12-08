final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-12-06";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "14528db0b7a1c908513cc8c1a52a3c1165c66c6b";
    sha256 = "12q4acnbrs7gw7v4c9a7p4ns17izirrvidq6sjb9r0sr76bd4ddf";
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
