{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "zsh-vi-mode";
  version = "unstable-2021-09-05";

  src = fetchFromGitHub {
    owner = "jeffreytse";
    repo = "zsh-vi-mode";
    rev = "82f00eaefc95165f4524e77312db0d216a64a7ad";
    sha256 = "0w74jmjmmffqlyqgbh7w96xlcgzflbjc3k1f28fnlr6ym0x9wr4r";
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
