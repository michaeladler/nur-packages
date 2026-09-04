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
}:

stdenv.mkDerivation {
  pname = "sso-mib";
  version = "0.10.2";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "sso-mib";
    rev = "59e77a67aa534deb6ffbf9fbd533b61158b011cd";
    sha256 = "sha256-yJAmVWQg4+nG8wkigRYd7Lqmj+GlzVhWfsOO0jEDHRI=";
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

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=stable"
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
