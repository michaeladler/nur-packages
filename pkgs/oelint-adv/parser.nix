{ lib, stdenv, fetchFromGitHub, python3Packages, ... }:

python3Packages.buildPythonPackage rec {
  pname = "oelint_parser";
  version = "unstable-2021-08-09";

  src = fetchFromGitHub {
    owner = "priv-kweihmann";
    repo = "oelint-parser";
    rev = "102d03433dad9bdf80a1808eedafc1e4350d8688";
    sha256 = "05smmnzxsal6xkx2ha4ggycbcs0fykb47qbrqr3cmjn5pjfqba7m";
  };

  meta = with lib; {
    homepage = "https://github.com/priv-kweihmann/oelint-parser";
    description = "alternative parser for bitbake recipes";
    license = licenses.bsd2;
  };
}
