{ stdenv
, lib
, fetchFromGitHub
, makeWrapper
, efitools
, coreutils
, bash
, util-linux
, openssl
, wget
, sbsigntool
}:

stdenv.mkDerivation rec {
  pname = "sbkeys";
  version = "unstable-2021-11-08";

  src = fetchFromGitHub {
    owner = "electrickite";
    repo = "sbkeys";
    rev = "64c726e502e48e63de4834fad0bdf12c026f7899";
    sha256 = "0hig5akgmq97wwcv7g4afw5iqbhlv0ky4aln9vscrca0376ylmsb";
  };

  nativeBuildInputs = [ makeWrapper ];

  patchPhase = ''
    patchShebangs sbkeys
  '';

  installPhase = ''
    install -D -m0755 sbkeys $out/bin/sbkeys
  '';

  wrapperPath = with lib; makeBinPath [
    efitools
    coreutils
    bash
    util-linux
    openssl
    wget
    sbsigntool
  ];

  postFixup = ''
    wrapProgram $out/bin/sbkeys \
      --prefix PATH : "${wrapperPath}"
  '';

  meta = with lib; {
    homepage = "https://github.com/electrickite/sbkeys";
    description = "Simple script to generate Secure Boot keys";
    platforms = platforms.linux;
    license = licenses.gpl3;
  };

}
