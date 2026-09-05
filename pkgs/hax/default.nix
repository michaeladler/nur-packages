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
  version = "0.5.0-unstable-2026-09-04";

  src = fetchFromGitHub {
    owner = "OleksandrChekhovskyi";
    repo = "hax";
    rev = "95e0179c00266601b2c8345981e98895b1250699";
    sha256 = "sha256-d3gbxS+4q1UqtkGfcqF37yCKoQ4vprupgI2TN+3v4aM=";
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
