{ stdenv, lib, fetchurl, installShellFiles }:

let metadata = with builtins; fromJSON (readFile ./metadata.json); in

stdenv.mkDerivation rec {
  name = "pandoc";
  version = metadata.version;

  src = fetchurl {
    inherit (metadata) url sha256;
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
