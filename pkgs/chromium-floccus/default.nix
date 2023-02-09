{ stdenv, lib, fetchurl, pkgs }:

let metadata = with builtins; fromJSON (readFile ./metadata.json); in

stdenv.mkDerivation rec {
  pname = "chromium-floccus";
  version = metadata.version;

  src = fetchurl {
    inherit (metadata) url sha256;
  };

  nativeBuildInputs = with pkgs; [ go-crx3 ];

  unpackPhase = "true";
  buildPhase = "true";

  installPhase = ''
    mkdir -p $out/share/${pname}
    CRX_TARGET=$out/share/${pname}/${pname}.crx
    cp $src $CRX_TARGET
    cat <<EOF > $out/share/${pname}/$(crx3 id $CRX_TARGET).json
    {
      "external_crx": "$CRX_TARGET",
      "external_version": "${version}"
    }
    EOF
  '';

  meta = with lib; {
    homepage = "https://github.com/floccusaddon/floccus";
    description = "Sync your bookmarks privately across browsers and devices";
    platforms = platforms.all;
    license = licenses.mpl20;
  };
}
