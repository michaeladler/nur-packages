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
  version = "0.9.0-unstable-2026-06-08";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "sso-mib";
    rev = "882bd1ab636ad801714da6324b21dce3b3db901c";
    sha256 = "sha256-OokZkKkC5SqdAjsOF5DLESFK5te5m6FsevLR1acbdeY=";
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
