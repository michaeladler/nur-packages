final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-10-24";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "0f6509381263a7f4fc9d1bf12b9854246d7ae945";
    sha256 = "0rk0x9c02kzl3qqdjf2b2r29ijjna366ybsjq6jk214nyr52lnjp";
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
