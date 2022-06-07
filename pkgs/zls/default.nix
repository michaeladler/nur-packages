final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2022-06-06";

  nativeBuildInputs = [ final.zig-master ];

  src = final.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "327e66c12b68f7974f81cb11cc618e789dc45a6a";
    sha256 = "1n9lqq5ph0654xc6msdmrb66gkh24y6d791vk8ak4pfhcl4n5j8b";
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
