{
  stdenv,
  lib,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "czmod";
  version = "unstable-2022-11-04";

  src = fetchFromGitHub {
    owner = "skywind3000";
    repo = "czmod";
    rev = "dedff7ed7ce05697c83c5adb0e0ff55429c7800e";
    sha256 = "1md7swg206mmn3lq3b7rbd2j8a82g0bn8d7bsfk2n5mkb25y9969";
  };

  buildPhase = ''
    $CC -O3 -o czmod czmod.c system/imembase.c system/iposix.c
  '';

  installPhase = ''
    install -D -s -m0755 czmod $out/bin/czmod

    install -D czmod.zsh \
      $out/share/zsh/plugins/czmod/czmod.zsh

    ln -s $out/share/zsh/plugins/czmod \
      $out/share/czmod
  '';

  meta = with lib; {
    homepage = "https://github.com/skywind3000/czmod";
    description = "c module to boost z.lua";
    maintainers = [ maintainers.michaeladler ];
    platforms = platforms.unix;
    license = licenses.mit;
  };
}
