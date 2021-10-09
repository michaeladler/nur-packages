{ lib, stdenvNoCC, fetchFromGitHub, makeWrapper, fzf, gawk }:

stdenvNoCC.mkDerivation rec {
  pname = "sysz";
  version = "unstable-2021-10-08";

  src = fetchFromGitHub {
    owner = "joehillen";
    repo = "sysz";
    rev = "d5f6c27aac02bbb8bd96238c3515585264240d0e";
    sha256 = "166gfvvizlr4wp7k04n11yq7xsy3n4bjwb7nnhci7wmvp3dc3bg0";
  };

  nativeBuildInputs = [ makeWrapper ];
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 sysz $out/libexec/sysz
    makeWrapper $out/libexec/sysz $out/bin/sysz \
      --prefix PATH : ${lib.makeBinPath [ fzf gawk ]}
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/joehillen/sysz";
    description = "A fzf terminal UI for systemctl";
    license = licenses.unlicense;
    platforms = platforms.unix;
    changelog = "https://github.com/joehillen/sysz/blob/${version}/CHANGELOG.md";
  };
}
