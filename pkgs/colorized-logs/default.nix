{ stdenv, lib, fetchFromGitHub, cmake }:

stdenv.mkDerivation rec {
  pname = "colorized-logs";
  version = "unstable-2024-02-20";

  src = fetchFromGitHub {
    owner = "kilobyte";
    repo = "colorized-logs";
    rev = "2fb2ea5db6c830b8426a2e7084e0ad5af83f1070";
    sha256 = "0124axfiw6qln3sw6g1kz0r0r72p63001fb9g74lr3n7cadf6xhl";
  };

  nativeBuildInputs = [ cmake ];

  meta = with lib; {
    homepage = "https://github.com/kilobyte/colorized-logs";
    description = "tools for logs with ANSI color";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
