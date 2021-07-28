{ stdenv, lib, fetchFromGitHub, makeWrapper, perl, btrfs-progs }:

stdenv.mkDerivation rec {
  pname = "btrfs-list";
  version = "unstable-2020-02-19";

  src = fetchFromGitHub {
    owner = "speed47";
    repo = "btrfs-list";
    rev = "8fbe5b851372603e7c48f7b90d9a76e24131a3c8";
    sha256 = "1j6bs7d16ijqw2aqqx3yl9lxnwqlz6ha6rzk7fw80aa8w6bdy5k6";
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
