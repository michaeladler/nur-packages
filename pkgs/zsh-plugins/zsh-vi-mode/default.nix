{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "zsh-vi-mode";
  version = "2021-07-09";

  src = fetchFromGitHub {
    owner = "jeffreytse";
    repo = "zsh-vi-mode";
    rev = "5eb9c43f941a3ac419584a5c390aeedf4916b245";
    sha256 = "0qfzai7319ndi81crlpxfkpl1ry3hyjr87q7n6y5s6s4kgq38swr";
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
