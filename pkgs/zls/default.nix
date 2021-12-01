final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-11-30";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "227dcb465058cb1816d3040e929a587673f21450";
    sha256 = "1kzrp1gsjbbdkmz1w043jh9w03n4wil27b5b3fr33w3s8rvqjy64";
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
