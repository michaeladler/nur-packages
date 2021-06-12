{ stdenv, lib, fetchurl, installShellFiles }:

let
  manpage = fetchurl {
    url =
      "https://github.com/void-linux/void-runit/raw/42ca737148ea530dad5945af1a4eb7e471e8b637/zzz.8";
    sha256 = "1da15aqv4ighnjw4i5k9x11fskwy4qi9pk5x4f8sqvvks7pswm5j";
  };

in stdenv.mkDerivation rec {
  name = "zzz";
  version = "2020-10-01";

  src = fetchurl {
    url =
      "https://github.com/void-linux/void-runit/raw/42ca737148ea530dad5945af1a4eb7e471e8b637/zzz";
    sha256 = "07m09rxgwd08fylc6916gq4h5kpq6zzq789s0gsg8qbv2j6jsh3r";
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
