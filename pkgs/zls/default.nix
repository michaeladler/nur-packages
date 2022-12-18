final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2022-12-17";

  nativeBuildInputs = [ final.zig-master ];

  src = final.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "375daba743c9c575be7081767c9de69557722ec7";
    sha256 = "1fnhqrdphpdlv2dkj07a88z372j3isn9qyn9j0hn3a7ga6yi39sm";
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
