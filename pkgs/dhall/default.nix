{ stdenv, lib, fetchurl, installShellFiles }:

stdenv.mkDerivation rec {
  pname = "dhall";
  version = "1.40.1";

  src = fetchurl {
    url = "https://github.com/dhall-lang/dhall-haskell/releases/download/${version}/dhall-${version}-x86_64-linux.tar.bz2";
    sha256 = "213ee6eb2792bf5bacf89b4f1fde6449310476ce4ab37d769d6037179f5adb6e";
  };

  nativeBuildInputs = [ installShellFiles ];

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp bin/dhall $out/bin
    chmod 0755 $out/bin/*
    installManPage share/man/dhall.1
  '';

  meta = with lib; {
    homepage = "https://github.com/dhall-lang/dhall-haskell";
    description = "Maintainable configuration files";
    platforms = platforms.linux;
    license = licenses.bsd3;
  };

}
