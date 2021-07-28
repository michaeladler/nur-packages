{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "peda";
  version = "unstable-2021-01-03";

  src = fetchFromGitHub {
    owner = "longld";
    repo = "peda";
    rev = "84d38bda505941ba823db7f6c1bcca1e485a2d43";
    sha256 = "1121pgg2v7vfk46fikys5zb73dia5l65zj3z49kdcln2c7slklxy";
  };

  installPhase = ''
    mkdir -p $out/share/peda

    cp *.py $out/share/peda/
    cp -r lib $out/share/peda/
  '';

  meta = with lib; {
    homepage = "https://github.com/longld/peda";
    description = "Python Exploit Development Assistance for GDB";
    platforms = platforms.all;
    license = licenses.cc-by-nc-sa-30;
  };
}
