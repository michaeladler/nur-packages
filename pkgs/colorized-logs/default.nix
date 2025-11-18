{
  stdenv,
  lib,
  fetchFromGitHub,
  cmake,
}:

stdenv.mkDerivation rec {
  pname = "colorized-logs";
  version = "unstable-2025-03-29";

  src = fetchFromGitHub {
    owner = "kilobyte";
    repo = "colorized-logs";
    rev = "8b7572449706b48a80e290e1ef88c4a4dd24bda9";
    sha256 = "1y1bgczznal8q1zy1w8n86mc23ks2aki6f1hqpjlf3cnxga3zcwv";
  };

  nativeBuildInputs = [ cmake ];

  meta = with lib; {
    homepage = "https://github.com/kilobyte/colorized-logs";
    description = "tools for logs with ANSI color";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
