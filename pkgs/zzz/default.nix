{ stdenv, lib, fetchurl, installShellFiles }:

let
  manpage = fetchurl {
    url =
      "https://github.com/void-linux/void-runit/raw/42ca737148ea530dad5945af1a4eb7e471e8b637/zzz.8";
    sha256 = "b254aeefd1736fac9123bdcc9b22269e4fed42e8699648b8b4f045b2b12a41b5";
  };

in stdenv.mkDerivation rec {
  name = "zzz";
  version = "2020-10-01";

  src = fetchurl {
    url =
      "https://github.com/void-linux/void-runit/raw/42ca737148ea530dad5945af1a4eb7e471e8b637/zzz";
    sha256 = "79402d8d147b61f4f4033aa183ff37f8ce02097e2624c3a8770834fe7a4ea01e";
  };

  nativeBuildInputs = [ installShellFiles ];

  unpackPhase = "cp $src zzz";

  installPhase = ''
    install -D -m 0755 zzz $out/bin/zzz
    installManPage ${manpage}
  '';

  meta = with lib; {
    homepage = "https://github.com/void-linux/void-runit/blob/master/zzz";
    description = "zzz - really simple suspend script";
    maintainers = [ "Michael Adler <therisen06@gmail.com>" ];
    platforms = platforms.linux;
    license = licenses.cc0;
  };
}
