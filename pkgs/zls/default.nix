final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "2021-06-24";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "96af681d21839e6f88b8d6545ff89991210ad886";
    sha256 = "155darmba7adpqj62la8fqmp27vgshh9ip42rnj53yydkkgx48ad";
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
