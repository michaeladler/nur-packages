{ lib, stdenv, fetchFromGitHub, python3Packages, ... }:

python3Packages.buildPythonPackage rec {
  pname = "oelint_parser";
  version = "unstable-2021-08-01";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-parser";
    rev = "67d5995e95c565f68dcdc493ff8b0d98a3178924";
    sha256 = "118aym9wbvd9hdjymihbb9rma9davv7qgrgcr7hqaf9xjcg6xy52";
  };

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-parser";
    description = "alternative parser for bitbake recipes";
    license = licenses.bsd2;
  };
}
