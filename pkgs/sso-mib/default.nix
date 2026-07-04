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
}:

stdenv.mkDerivation {
  pname = "sso-mib";
  version = "0.10.0-unstable-2026-07-03";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "sso-mib";
    rev = "0bedfc1bdf7010a9feaa82112cdc77ae60ff16bc";
    sha256 = "sha256-33NWgGQhK6Y1c9aV1n/y4mrxWh+lpiHoI9b6QkGVqVg=";
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
  ];

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
