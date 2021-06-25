final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "2021-06-24";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "865ca42ed494c597cd4a818cea1edc1fbe96d636";
    sha256 = "1rrifhyvra0915kg5qiwmax1ajq2wyh6nklag2kpbmz5pbkhs1hr";
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
