{ lib, stdenvNoCC, fetchFromGitHub, makeWrapper, fzf, gawk }:

stdenvNoCC.mkDerivation rec {
  pname = "sysz";
  version = "unstable-2021-09-21";

  src = fetchFromGitHub {
    owner = "joehillen";
    repo = "sysz";
    rev = "efb271a68a122308517a95d0f8ad3873732b1516";
    sha256 = "0kjh6z5jpwsv3v89m1v0ys96jh2ybw181m7i8694cqgmy9jsamcn";
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
