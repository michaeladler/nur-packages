final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2022-06-05";

  nativeBuildInputs = [ final.zig-master ];

  src = final.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "289d137d1343ecd8d9b68eea9a01c830062cd20e";
    sha256 = "01b65g0i446q5x5f7hicz0kzyxdqh1d1j876ncq58q266ammsx9c";
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
