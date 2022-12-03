final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2022-12-02";

  nativeBuildInputs = [ final.zig-master ];

  src = final.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "3ab859a304537816f42a6dd1b8ed16804da6083e";
    sha256 = "05nsf4vniqwb581si5iml3g530w5hxhqrh990kxbqm7wdl5vzmlj";
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
