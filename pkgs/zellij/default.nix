{ stdenv, lib, fetchurl }:

let metadata = with builtins; fromJSON (readFile ./metadata.json); in

stdenv.mkDerivation rec {
  pname = "zellij";
  inherit (metadata) version;

  src = fetchurl {
    inherit (metadata) url sha256;
  };

  dontBuild = true;
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    tar -C $out/bin -x -z -f $src
  '';

  meta = with lib; {
    description = "A terminal workspace with batteries included";
    homepage = "https://zellij.dev/";
    changelog = "https://github.com/zellij-org/zellij/blob/v${version}/CHANGELOG.md";
    license = with licenses; [ mit ];
  };
}
