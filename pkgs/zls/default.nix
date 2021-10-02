final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "unstable-2021-09-30";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "b63339e35043e7cdd39507f004b0ce99820af976";
    sha256 = "0z7xf2n8xafs64q6fsc6vgazafh8k0cipsmxqvylcsisq2fyziv6";
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
