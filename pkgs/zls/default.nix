final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-09-21";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "03f70be32a8bba7d16eb894a97779c7525a5ddfc";
    sha256 = "126h82f0261zr01pz9ylqy83km6w2ylb4h2a788afdym5ann1a29";
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
