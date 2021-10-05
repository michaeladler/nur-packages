{ stdenv, lib, fetchurl, installShellFiles }:

stdenv.mkDerivation {
  pname = "dhall";
  version = "1.40.1";

  src = fetchurl {
    url = "https://github.com/dhall-lang/dhall-haskell/releases/download/1.40.1/dhall-1.40.1-x86_64-linux.tar.bz2";
    sha256 = "0vnvbagifdv0kmv7vcsarrv08ca9ckg1ykwvz2n5pgwj4zmycgi1";
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
