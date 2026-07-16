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
  version = "0.10.1-unstable-2026-07-15";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "sso-mib";
    rev = "9ec35460d62e6340951abae696f2f08eb8d8272b";
    sha256 = "sha256-WBZOyS9If7jwRoKmurJ2kepjhQetscsnnupA57y0xoc=";
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
