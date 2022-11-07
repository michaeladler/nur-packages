{ stdenv, lib, fetchurl, pkgs }:

stdenv.mkDerivation rec {

  pname = "chromium-xbrowsersync";
  version = "1.5.2";

  src = fetchurl {
    url = "https://github.com/xbrowsersync/app/releases/download/v${version}/xbrowsersync_${version}_chrome.zip";
    sha256 = "017g4qfg8g3ma8abjn69bgspw1xawv4m0phblkwc9sn9zda0dddm";
  };

  nativeBuildInputs = with pkgs; [ go-crx3 ];

  phases = [ "unpackPhase" "buildPhase" "installPhase" ];

  unpackPhase = "cp $src ${pname}.zip";

  buildPhase = "crx3 pack ${pname}.zip -o ${pname}.crx";

  installPhase = ''
    mkdir -p $out/share/${pname}
    CRX_TARGET=$out/share/${pname}/${pname}.crx
    cp *.crx $CRX_TARGET
    cat <<EOF > $out/share/${pname}/$(crx3 id $CRX_TARGET).json
    {
      "external_crx": "$CRX_TARGET",
      "external_version": "${version}"
    }
    EOF
  '';

  meta = with lib; {
    homepage = "https://github.com/xbrowsersync/app";
    description = "xBrowserSync browser extension";
    platforms = platforms.all;
    license = licenses.gpl3Plus;
  };
}
