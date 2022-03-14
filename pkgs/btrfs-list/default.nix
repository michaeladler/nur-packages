{ stdenv, lib, fetchFromGitHub, makeWrapper, perl, btrfs-progs }:

stdenv.mkDerivation rec {
  pname = "btrfs-list";
  version = "unstable-2022-03-13";

  src = fetchFromGitHub {
    owner = "speed47";
    repo = "btrfs-list";
    rev = "4564559c850734f75071db2a1d923fa3c791ef9e";
    sha256 = "01p8kyfgm8kxpwcs0p092nhs180z3pw044a9g7cb7c8zzn2ymm16";
  };

  buildInputs = [ perl ];

  nativeBuildInputs = [ makeWrapper ];

  patchPhase = ''
    patchShebangs btrfs-list
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp btrfs-list $out/bin
    chmod 0755 $out/bin/btrfs-list
  '';

  wrapperPath = with lib; makeBinPath [
    btrfs-progs
  ];

  postFixup = ''
    wrapProgram $out/bin/btrfs-list \
      --prefix PATH : "${wrapperPath}"
  '';

  meta = with lib; {
    homepage = "https://github.com/speed47/btrfs-list";
    description = "Get a nice tree-style view of your btrfs subvolumes/snapshots";
    platforms = platforms.linux;
    license = licenses.gpl2Only;
  };

}
