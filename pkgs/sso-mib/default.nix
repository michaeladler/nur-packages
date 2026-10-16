{
  stdenv,
  lib,
  fetchFromGitHub,
  pkg-config,
  meson,
  ninja,
  libjwt,
  libuuid,
  glib,
  json-glib,
  nix-update-script,
  cyrus_sasl,
}:

stdenv.mkDerivation {
  pname = "sso-mib";
  version = "0-unstable-2026-10-16";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "sso-mib";
    rev = "09ea1c8a7af0d6fba8941d7ed25b58121e5a2885";
    sha256 = "sha256-qOiTFeMmoWt9jKkRsC53ZMsrdC9vrN/dWkBnfW9YO28=";
  };

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
  ];

  buildInputs = [
    libjwt
    libuuid
    glib
    json-glib
    cyrus_sasl
  ];

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=branch=feat/sasl-plugin"
    ];
  };

  meta = with lib; {
    homepage = "https://github.com/siemens/sso-mib";
    description = " C library to interact with a locally running microsoft-identity-broker to get various authentication tokens via DBus. ";
    maintainers = [ maintainers.michaeladler ];
    platforms = platforms.all;
    license = [
      licenses.gpl2Only
      licenses.lgpl21Only
    ];
  };
}
