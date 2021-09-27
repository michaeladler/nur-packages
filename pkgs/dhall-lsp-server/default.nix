{ stdenv, lib, fetchurl }:

stdenv.mkDerivation rec {
  pname = "dhall-lsp-server";
  version = "1.0.16";

  src = fetchurl {
    url = "https://github.com/dhall-lang/dhall-haskell/releases/download/1.40.1/dhall-lsp-server-${version}-x86_64-linux.tar.bz2";
    sha256 = "sha256-iLF+Jcuow3Zfg4jIgPKF0nCI/6SDL5beuZoswf9rz5w=";
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    mv bin/* $out/bin/
    chmod 0755 $out/bin/*
  '';

  meta = with lib; {
    homepage = "https://github.com/dhall-lang/dhall-haskell";
    description = "Dhall LSP server";
    platforms = platforms.linux;
    license = licenses.bsd3;
  };

}
