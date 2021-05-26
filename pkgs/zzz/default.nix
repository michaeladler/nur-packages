{ stdenv, lib, fetchurl }:

stdenv.mkDerivation rec {
  name = "zzz";
  version = "2020-10-01";

  src = fetchurl {
    url =
      "https://raw.githubusercontent.com/void-linux/void-runit/7e5c4cfe0d8f7b2e9aa5e031582c99f2687b1633/zzz";
    sha256 = "79402d8d147b61f4f4033aa183ff37f8ce02097e2624c3a8770834fe7a4ea01e";
  };

  #phases = [ "unpackPhase" "installPhase" ];

  unpackPhase = "cp $src zzz";

  installPhase = ''
    install -D -m 0755 zzz $out/bin/zzz
  '';

  meta = with lib; {
    homepage = "https://github.com/void-linux/void-runit/blob/master/zzz";
    description = "zzz - really simple suspend script";
    maintainers = [ "Michael Adler <therisen06@gmail.com>" ];
    platforms = platforms.linux;
    license = licenses.cc0;
  };
}
