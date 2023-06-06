{ stdenv, lib, fetchurl, pkgs }:

stdenv.mkDerivation rec {
  pname = "chromium-vimium";
  version = "1.67.6";

  src = fetchurl {
    url = "https://github.com/philc/vimium/archive/refs/tags/v${version}.zip";
    sha256 = "1av4qcfw6shz3pbl4s625avbrynwpli3hbrlmf6jylndy98jkmwg";
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
