{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "zsh-vi-mode";
  version = "2021-07-03";

  src = fetchFromGitHub {
    owner = "jeffreytse";
    repo = "zsh-vi-mode";
    rev = "08fcc95d1cf67a559db466281f332640dc764b2c";
    sha256 = "13pq79qhfcjbkjxrx5x3p23v00fn64pbb0gsyjn0r8i45vnpzgnj";
  };

  installPhase = ''
    mkdir -p $out/share/zsh-vi-mode
    cp zsh-vi-mode.zsh $out/share/zsh-vi-mode/
  '';

  meta = with lib; {
    description = "A better and friendly vi(vim) mode plugin for ZSH.";
    homepage = "https://github.com/jeffreytse/zsh-vi-mode";
    license = licenses.mit;
    maintainers = "Michael Adler";
    platforms = platforms.unix;
  };
}
