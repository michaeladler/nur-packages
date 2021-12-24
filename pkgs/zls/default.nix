final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-12-23";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "18569926a36d6fcd107252b023990250b44382c3";
    sha256 = "1dh814zqixxykx8rfdxa15pjzdd72jw2rk8jfmflv39m61hrjhql";
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
