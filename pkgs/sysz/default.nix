{ lib, stdenvNoCC, fetchFromGitHub, makeWrapper, fzf, gawk }:

stdenvNoCC.mkDerivation rec {
  pname = "sysz";
  version = "unstable-2021-09-27";

  src = fetchFromGitHub {
    owner = "joehillen";
    repo = "sysz";
    rev = "51da0ca012852ba02bcfc5dc1231b9b1fedcc3d9";
    sha256 = "1fq24knarv0skgflb2npgnwxkj7jh8mkmv4b1ky3v2chkxib73ri";
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
