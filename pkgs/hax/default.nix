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
  version = "0.5.0-unstable-2026-09-19";

  src = fetchFromGitHub {
    owner = "OleksandrChekhovskyi";
    repo = "hax";
    rev = "7d0acc170d2c922e3d8d2f61963ce6668bb0b343";
    sha256 = "sha256-QqM20wUJRl9RnydsO7zIxDiZbkxi5zOvP0R8wEA1/Do=";
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
