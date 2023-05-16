{ stdenv, lib, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "colorized-logs";
  version = "unstable-2023-04-30";

  src = fetchFromGitHub {
    owner = "kilobyte";
    repo = "colorized-logs";
    rev = "7d6e17ae8d04764234328d2ded9006ec4e93b545";
    sha256 = "00h09qi9c67dgdqm6qp3yqhmzbdy4d2z3ramqrz22gjnkinhd0mf";
  };

  nativeBuildInputs = [ cmake ];

  meta = with lib; {
    homepage = "https://github.com/kilobyte/colorized-logs";
    description = "tools for logs with ANSI color";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
