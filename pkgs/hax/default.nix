{
  stdenv,
  lib,
  fetchFromGitHub,
  meson,
  ninja,
  pkgconf,
  curl,
  jansson,
}:

stdenv.mkDerivation {
  pname = "hax";
  version = "0.5.0-unstable-2026-09-22";

  src = fetchFromGitHub {
    owner = "OleksandrChekhovskyi";
    repo = "hax";
    rev = "f64e4abb8f435059a7cff06579fdf733053c285f";
    sha256 = "sha256-87AcxGpyOPK6t3J2jO/0FacNYeM6gX/Sre4LGk50pHo=";
  };

  nativeBuildInputs = [
    pkgconf
    meson
    ninja
  ];

  buildInputs = [
    curl
    jansson
  ];

  meta = with lib; {
    description = "A minimalist, terminal-native coding agent written in C.";
    mainProgram = "hax";
    homepage = "https://github.com/OleksandrChekhovskyi/hax";
    maintainers = [ maintainers.michaeladler ];
    platforms = platforms.unix;
    license = licenses.mit;
  };
}
