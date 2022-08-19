{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "czmod";
  version = "unstable-2021-02-15";

  src = fetchFromGitHub {
    owner = "skywind3000";
    repo = "czmod";
    rev = "c406a6c0975014f88d2bc138b679c195a8337948";
    sha256 = "1w3sa6p661ph2jyq34sdly5qf55wajrq4nf493lc4m7swlx374fp";
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
