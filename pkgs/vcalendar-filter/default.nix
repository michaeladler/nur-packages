{ src, lib, stdenv, fetchFromGitHub, perl, buildPerlPackage, perlPackages }:

with lib;

let metadata = sources.mutt-filters;

in buildPerlPackage rec {
  inherit src;

  pname = "vcalendar-filter";
  version = toString src.lastModifiedDate;

  buildInputs = [ perl ];
  propagatedBuildInputs = with perlPackages; [ DataICal TextAutoformat ];

  preConfigure = "touch Makefile.PL";
  doCheck = false;

  outputs = [ "out" ];

  installPhase = ''
    install -D -m0755 vcalendar-filter $out/bin/vcalendar-filter
  '';

  meta = {
    description =
      "vcalendar-filter is a simple filter to give plain text representations of vcards";
    license = licenses.gpl3Plus;
    homepage = "https://github.com/terabyte/mutt-filters";
    platforms = platforms.all;
    maintainers = "Michael Adler";
  };

}
