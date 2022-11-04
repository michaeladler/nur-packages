{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "czmod";
  version = "unstable-2022-11-04";

  src = fetchFromGitHub {
    owner = "skywind3000";
    repo = "czmod";
    rev = "dedff7ed7ce05697c83c5adb0e0ff55429c7800e";
    sha256 = "1md7swg206mmn3lq3b7rbd2j8a82g0bn8d7bsfk2n5mkb25y9969";
  };

  nativeBuildInputs = [ ];

  buildInputs = [ ];

  buildPhase = ''
    $CC -O3 -o czmod czmod.c system/imembase.c system/iposix.c
  '';

  installPhase = ''
    install -D -m0755 czmod $out/bin/czmod
    install -D -m0644 czmod.zsh $out/share/zsh/plugins/${pname}/czmod.zsh
  '';

  meta = with lib; {
    homepage = "https://github.com/skywind3000/czmod";
    description = "Native Module Written in C to Boost z.lua !!";
    maintainers = [ maintainers.michaeladler ];
    platforms = platforms.all;
    license = licenses.mit;
  };
}
