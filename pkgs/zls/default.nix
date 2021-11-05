final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-11-04";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "12cda9b0310605d170b932ebb6005e44e41f4ee1";
    sha256 = "156s1fv9lr1q8m75bjgqfpirahhfkib32sizrma3as0hqh7k8wzw";
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
