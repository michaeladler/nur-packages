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
  version = "0.5.0-unstable-2026-09-14";

  src = fetchFromGitHub {
    owner = "OleksandrChekhovskyi";
    repo = "hax";
    rev = "998ae96de106862d37ece395284fcf0c5a087b95";
    sha256 = "sha256-qYJYoY27VG/UHf++rgUFgsybe4+USTCCQ1//7Ojvx/w=";
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
