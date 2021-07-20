{ stdenv, lib, fetchFromGitHub, pkg-config, libgit2 }:

stdenv.mkDerivation rec {
  pname = "git-hours";
  version = "2021-04-20";
  src = fetchFromGitHub {
    owner = "ceigh";
    repo = "git-hours";
    rev = "996808c4c2fc1f4451222b06d8710d05fde770b2";
    sha256 = "0js7vpd0bhchmij7wgzpcyhgnrv2g2706ja3ab8lbdb8w6afb1a0";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ libgit2 ];

  patchPhase = ''
    sed -i -e "s#^PREFIX=.*#PREFIX=$out#" makefile
    sed -i -e "s#^MAN_PREFIX=.*#MAN_PREFIX=$out/man#" makefile
  '';

  buildPhase = ''
    cc -O $(pkg-config --cflags --libs libgit2) -o git-hours *.c
  '';

  preInstall = "mkdir -p $out/man $out/bin";


  meta = with lib; {
    homepage = "https://github.com/ceigh/git-hours";
    description = "Count the time spent on code via git";
    platforms = platforms.all;
    license = licenses.gpl3Plus;
  };
}
