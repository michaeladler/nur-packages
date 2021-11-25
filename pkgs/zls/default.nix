final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-11-24";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "7793b7250c699ea3a8aee6a66e5878ec7418149b";
    sha256 = "19m6m17ylqm8cxdmilpkalxxcwjflvsvhsfa03zmzmca2lh37cfr";
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
