{ stdenv, lib, fetchFromGitHub, makeWrapper, perl, btrfs-progs }:

stdenv.mkDerivation rec {
  pname = "btrfs-list";
  version = "unstable-2024-12-29";

  src = fetchFromGitHub {
    owner = "speed47";
    repo = "btrfs-list";
    rev = "4b64d533a7f2cf406c60e6973ff5924f5aa3dcd3";
    sha256 = "09v38ngvdw53k17w5ab2vyby9j9pjgrnasvykjrbx6hh3qaz3brb";
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
