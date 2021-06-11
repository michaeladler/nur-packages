{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "zsh-vi-mode";
  version = "2021-06-08";

  src = fetchFromGitHub {
    owner = "jeffreytse";
    repo = "zsh-vi-mode";
    rev = "9178e6bea2c8b4f7e998e59ef755820e761610c7";
    sha256 = "0a1rvc03rl66v8rgzvxpq0vw55hxn5b9dkmhdqghvi2f4dvi8fzx";
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
