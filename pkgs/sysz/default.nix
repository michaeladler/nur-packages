{ lib, stdenvNoCC, fetchFromGitHub, makeWrapper, fzf, gawk }:

stdenvNoCC.mkDerivation rec {
  pname = "sysz";
  version = "unstable-2021-10-11";

  src = fetchFromGitHub {
    owner = "joehillen";
    repo = "sysz";
    rev = "e65c00c9a7a633bf6e5aceb22314a0cfcfa71e03";
    sha256 = "1fx714rxmcavgqmv0wvslsj0wqwy6lsijyydn9bdmbh5gglsqrpb";
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
