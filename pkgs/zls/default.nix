final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2022-11-12";

  nativeBuildInputs = [ final.zig-master ];

  src = final.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "28adef42c160725cbc2c48ecf893f3bfe277531c";
    sha256 = "1ksikl2s5cp8prqxy5rvlmsryfwnc96nddalp0y286mfgdxlqdml";
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
