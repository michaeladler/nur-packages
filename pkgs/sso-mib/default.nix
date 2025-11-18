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
  fetchurl,
}:

stdenv.mkDerivation {
  pname = "sso-mib";
  version = "0.7.0-unstable-2025-11-17";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "sso-mib";
    rev = "87cf673a7e5b87546849a653c75300fc5f541fd8";
    sha256 = "sha256-ijoCunQdgxrkpklJf7i9LOu3p/yDBCIDvwg9OOx1/SM=";
  };

  patches = [
    (fetchurl {
      url = "https://github.com/siemens/sso-mib/commit/589c803be7b6f79a098a8ac577385e34085f8772.patch";
      sha256 = "sha256-o8VkOohxwuyYe9uUOKfyno7J6+8mKn8g1RPnoBeXzx0=";
    })
  ];

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
    license = licenses.gpl2Only;
  };
}
