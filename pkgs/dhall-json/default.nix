{ stdenv, lib, fetchurl }:

stdenv.mkDerivation rec {
  pname = "dhall-json";
  version = "1.7.8";

  src = fetchurl {
    url = "https://github.com/dhall-lang/dhall-haskell/releases/download/1.40.1/dhall-json-1.7.8-x86_64-linux.tar.bz2";
    sha256 = "0jygr0c9acijz83fp0ap4a64fkp2q7yh9ilyzds0jhz0gikbjclq";
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    mv bin/* $out/bin/
    chmod 0755 $out/bin/*
  '';

  meta = with lib; {
    homepage = "https://github.com/dhall-lang/dhall-haskell";
    description = "Dhall to JSON/YAML";
    platforms = platforms.linux;
    license = licenses.bsd3;
  };

}
