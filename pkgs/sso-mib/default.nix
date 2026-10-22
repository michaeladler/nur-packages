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
  version = "0.10.2-unstable-2026-10-22";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "sso-mib";
    rev = "05a1d1b725651f318bac09faa180d7cf523281d7";
    sha256 = "sha256-TiulhzUkk2J0qTiqbWaveULAhPvY7uqO6GdLkeUVCxY=";
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
      "--version=branch=main"
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
