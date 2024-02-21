{ stdenv, lib, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "colorized-logs";
  version = "unstable-2024-02-20";

  src = fetchFromGitHub {
    owner = "kilobyte";
    repo = "colorized-logs";
    rev = "4e21897f91659441c3e8a312e787933aca2c6fe0";
    sha256 = "0qjpk0cq3rka0f8ficd58mhfx9wr82hagj9ywa99wzsk2q2iabkq";
  };

  nativeBuildInputs = [ cmake ];

  meta = with lib; {
    homepage = "https://github.com/kilobyte/colorized-logs";
    description = "tools for logs with ANSI color";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
