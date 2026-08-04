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
  version = "0.10.1-unstable-2026-08-03";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "sso-mib";
    rev = "341b6cd599f251b7115353c48cce4a822d53d587";
    sha256 = "sha256-Q+7pUjHLWL3+8Omj706GkEEVgygzvZFS2sZK9uZljWg=";
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
