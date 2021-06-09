{ src, stdenv, lib }:

stdenv.mkDerivation {
  pname = "zsh-vi-mode";
  version = toString src.lastModifiedDate;

  inherit src;

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
