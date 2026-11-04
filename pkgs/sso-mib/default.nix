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
  version = "0.11.0-unstable-2026-11-03";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "sso-mib";
    rev = "c425e481799a3eaf4740d722499f3bb93995b694";
    sha256 = "sha256-ggBiwPao+QaE5AN7QkyErHclOsGhf0GPfTe9auaZuww=";
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
