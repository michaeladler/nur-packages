final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-07-27";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "3172717af8b9b0b9f354482e43ea883f2e9759ac";
    sha256 = "1dd5ja4wcpcsf4h1x1hhzn9flghhaj3yj517sxc2ngqm6d6cg502";
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
