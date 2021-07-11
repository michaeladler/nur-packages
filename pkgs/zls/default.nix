final: prev:

# https://github.com/zigtools/zls/blob/master/default.nix
prev.zls.overrideAttrs (oa: {
  version = "2021-07-10";

  src = prev.fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "70cfba0eb92fc57558cd9736233d5515e70b24cd";
    sha256 = "13kx9iqx2fjv8mj0nwqfwqib7njvjvjn5hvvaysia6i98xh44318";
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
