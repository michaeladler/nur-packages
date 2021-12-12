final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-12-11";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "abe82f60695a4203c4bf4f1afb1236a36815fc11";
    sha256 = "02k3kaqiw69vyj81arlv4nihapi3i9sx6ij0pminncdqqhg7hhw8";
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
