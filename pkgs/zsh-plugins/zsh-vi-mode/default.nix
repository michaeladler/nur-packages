{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "zsh-vi-mode";
  version = "unstable-2021-11-07";

  src = fetchFromGitHub {
    owner = "jeffreytse";
    repo = "zsh-vi-mode";
    rev = "0eb3c7b43b1f0a81af3676b150747b839e17c125";
    sha256 = "00rfx07b08yjr0r1bhqbjp405dxh22nz0b5c1mpp7jhc7mdg6rry";
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
