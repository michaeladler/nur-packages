{ lib, fetchFromGitHub, perl, perlPackages }:

perlPackages.buildPerlPackage {
  pname = "vcalendar-filter";
  version = "unstable-2016-06-07";

  src = fetchFromGitHub {
    owner = "terabyte";
    repo = "mutt-filters";
    rev = "f6835454e806d4d385da5fd83c20fd74ff3fa2d2";
    sha256 = "0gmldqyrb6iilvf9r55kyhv50ca9ghpxsxxb5cxd3rpsv2l8b8h9";
  };

  buildInputs = [ perl ];
  propagatedBuildInputs = with perlPackages; [ DataICal TextAutoformat ];

  preConfigure = "touch Makefile.PL";
  doCheck = false;

  outputs = [ "out" ];

  installPhase = ''
    install -D -m0755 vcalendar-filter $out/bin/vcalendar-filter
  '';

  meta = with lib; {
    description =
      "vcalendar-filter is a simple filter to give plain text representations of vcards";
    license = licenses.gpl3Plus;
    homepage = "https://github.com/terabyte/mutt-filters";
    platforms = platforms.all;
  };

}
