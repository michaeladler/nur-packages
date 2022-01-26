{ stdenv, lib, fetchurl, installShellFiles }:

stdenv.mkDerivation rec {
  name = "pandoc";
  version = "2.17.0.1";

  src = fetchurl {
    url = "https://github.com/jgm/pandoc/releases/download/${version}/pandoc-${version}-linux-amd64.tar.gz";
    sha256 = "sha256-EIz0QKkRHeJyEuG2+EWaIRxBTjFz3fwHtlcDyzmmbwk=";
  };

  nativeBuildInputs = [ installShellFiles ];
  buildInputs = [ ];

  buildPhase = "true";
  installPhase = ''
    mkdir -p $out/bin/
    mv bin/* $out/bin/
    installManPage share/man/man1/pandoc.1.gz
  '';

}
