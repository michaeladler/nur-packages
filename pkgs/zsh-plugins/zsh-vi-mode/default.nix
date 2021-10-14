{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "zsh-vi-mode";
  version = "unstable-2021-10-13";

  src = fetchFromGitHub {
    owner = "jeffreytse";
    repo = "zsh-vi-mode";
    rev = "479edeeed3c877f43f85c2c68676e7c5605acdbe";
    sha256 = "1934wr937qlbj0gz55p1ck2b2wb7qm53kcbgyqm7l0h6dkm909kn";
  };

  installPhase = ''
    mkdir -p $out/share/zsh-vi-mode
    cp zsh-vi-mode.zsh $out/share/zsh-vi-mode/
  '';

  meta = with lib; {
    description = "A better and friendly vi(vim) mode plugin for ZSH.";
    homepage = "https://github.com/jeffreytse/zsh-vi-mode";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
