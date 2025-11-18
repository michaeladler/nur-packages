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
  version = "0.7.0-unstable-2025-11-18";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "sso-mib";
    rev = "3c5dcdbdbc54277dee8cf2c166432adf82c272a6";
    sha256 = "sha256-gmbYBOMBIaUK3kyAGxjyo7BYfZunte2rWTV9EI4rgzQ=";
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
