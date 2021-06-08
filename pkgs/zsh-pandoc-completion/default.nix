{ src, stdenv, lib, installShellFiles }:

stdenv.mkDerivation {
  pname = "zsh-pandoc-completion";
  version = toString src.lastModifiedDate;

  inherit src;

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    installShellCompletion --zsh --name _pandoc _pandoc
  '';

  meta = with lib; {
    description = "Simple completion function to complete pandoc in zsh";
    homepage = "https://github.com/srijanshetty/zsh-pandoc-completion";
    license = licenses.mit;
    maintainers = "Michael Adler";
    platforms = platforms.unix;
  };
}
