{ stdenv, lib, fetchurl }:

stdenv.mkDerivation rec {
  pname = "dhall-json";
  version = "1.7.8";

  src = fetchurl {
    url = "https://github.com/dhall-lang/dhall-haskell/releases/download/1.40.1/dhall-json-${version}-x86_64-linux.tar.bz2";
    sha256 = "sha256-mDK5ZnzgQwl0+57GBP3B4k5HjCJXgesG+jIylRjIz0s=";
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
