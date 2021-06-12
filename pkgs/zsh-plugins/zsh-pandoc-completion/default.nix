{ stdenvNoCC, lib, fetchFromGitHub, installShellFiles }:

stdenvNoCC.mkDerivation {
  pname = "zsh-pandoc-completion";
  version = "2019-07-06";

  src = fetchFromGitHub {
    owner = "srijanshetty";
    repo = "zsh-pandoc-completion";
    rev = "dbaa23ceef8472d845e0c8dab3ef493fd76a9f47";
    sha256 = "1j3mp3x9gqy7szcc0g192wx1c8lyfswkrng13dy6a841d5iy5598";
  };

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
