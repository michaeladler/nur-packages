{ stdenv, lib, fetchurl }:

stdenv.mkDerivation {
  pname = "dhall-lsp-server";
  version = "1.0.16";

  src = fetchurl {
    url = "https://github.com/dhall-lang/dhall-haskell/releases/download/1.40.1/dhall-lsp-server-1.0.16-x86_64-linux.tar.bz2";
    sha256 = "176gdgzw2b4sp7g9cbw3lkzqhw6jhpr81j48hdgpdhx8rcjpxcc8";
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