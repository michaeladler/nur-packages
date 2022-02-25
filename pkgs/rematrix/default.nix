{ stdenv
, lib
, fetchFromGitHub
, cmake
, xorg
, glew
, python3
}:

stdenv.mkDerivation rec {

  pname = "rematrix";
  version = "unstable-2021-03-18";

  src = fetchFromGitHub {
    owner = "a12n";
    repo = "rematrix";
    rev = "e539a5573a99665ba7b21e1c2114508060dcd163";
    sha256 = "1n6gz1dmjg36rznjfb932wkcd2frjjyy247qlvag6glkjv14m00i";
  };

  nativeBuildInputs = [ cmake (python3.withPackages (ps: with ps; [ pillow ])) ];

  buildInputs = [ xorg.libX11 glew ];

  meta = with lib; {
    homepage = "https://github.com/a12n/rematrix";
    description = "Digital rain in X Window System root window";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
