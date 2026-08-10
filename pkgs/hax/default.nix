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
  version = "unstable-2026-08-06";

  src = fetchFromGitHub {
    owner = "OleksandrChekhovskyi";
    repo = "hax";
    rev = "cb1a429bd5b2a5908ac7f5b84159d0220d95d7b7";
    sha256 = "014mrl3cg2102r4y67j93jphzk22msmxplv0ab126pnpddbmky62";
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
