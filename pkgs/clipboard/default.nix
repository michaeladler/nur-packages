{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, xorg }:

stdenv.mkDerivation rec {
  pname = "clipboard";
  version = "unstable-2023-01-15";

  src = fetchFromGitHub {
    owner = "Slackadays";
    repo = "Clipboard";
    rev = "acf6a9d9cca2ff5e5c104f3869fc937bb715d198";
    sha256 = "06727g0nds98z3ilbssk4r065ygwl3hm9rvn8y9rrkj6gqkczgrv";
  };

  nativeBuildInputs = [ pkg-config cmake ];

  buildInputs = [ xorg.libX11 ];

  cmakeFlags = [
    "-DINSTALL_PREFIX=$out"
  ];

  meta = with lib; {
    homepage = "https://github.com/Slackadays/Clipboard";
    description = "Cut, copy, and paste anything, anywhere, all from the terminal";
    platforms = platforms.all;
    license = licenses.gpl3Only;
  };
}
