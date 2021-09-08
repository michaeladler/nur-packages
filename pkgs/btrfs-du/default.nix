{ stdenv, lib, fetchFromGitHub, makeWrapper, btrfs-progs }:

stdenv.mkDerivation rec {
  pname = "btrfs-du";
  version = "unstable-2021-09-07";

  src = fetchFromGitHub {
    owner = "nachoparker";
    repo = "btrfs-du";
    rev = "dc0194d9f31a88a0ca823d734d672a4a53d24029";
    sha256 = "0lsv2afgbfv787ab7y66bf1nxl8b0d3bm988q7k5gcqnk46xc3z4";
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
