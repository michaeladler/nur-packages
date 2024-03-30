{ stdenv, lib, fetchurl, pkgs }:

stdenv.mkDerivation rec {
  pname = "chromium-vimium";
  version = "2.1.1";

  src = fetchurl {
    url = "https://github.com/philc/vimium/archive/refs/tags/v${version}.zip";
    sha256 = "1ik2k4hpnqhn0izkhb456zwq5irhafycjj4g40zwwp2qbfr08jz8";
  };

  nativeBuildInputs = with pkgs; [ unzip go-crx3 ];

  phases = [ "unpackPhase" "buildPhase" "installPhase" ];

  unpackPhase = ''
    unzip $src
  '';

  buildPhase = ''
    mv vimium-* vimium
    rm -rf "vimium/tests" "vimium/test_harnesses"
    crx3 pack vimium -o ${pname}.crx
  '';

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
    homepage = "https://github.com/philc/vimium";
    description = "The hacker's browser";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
