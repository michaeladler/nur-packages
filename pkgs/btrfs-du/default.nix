{ stdenv, lib, fetchFromGitHub, makeWrapper, btrfs-progs }:

stdenv.mkDerivation rec {
  pname = "btrfs-du";
  version = "unstable-2020-06-16";

  src = fetchFromGitHub {
    owner = "nachoparker";
    repo = "btrfs-du";
    rev = "239fbb80daeffcd695c0493f04968a5690fb4f80";
    sha256 = "1g295sqplfacjjjz9vw7318wiwqlc633xi9mbdbc7g8x7nzyjjkx";
  };

  nativeBuildInputs = [ makeWrapper ];

  patchPhase = ''
    patchShebangs btrfs-du
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp btrfs-du $out/bin
    chmod 0755 $out/bin/btrfs-du
  '';

  wrapperPath = with lib; makeBinPath [
    btrfs-progs
  ];

  postFixup = ''
    wrapProgram $out/bin/btrfs-du \
      --prefix PATH : "${wrapperPath}"
  '';

  meta = with lib; {
    homepage = "https://github.com/nachoparker/btrfs-du";
    description = "Easily print BTRFS subvolume/snapshot disk usage ";
    platforms = platforms.linux;
    license = licenses.gpl3;
  };

}
