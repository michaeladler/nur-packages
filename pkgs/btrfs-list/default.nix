{ stdenv, lib, fetchFromGitHub, makeWrapper, perl, btrfs-progs }:

stdenv.mkDerivation rec {
  pname = "btrfs-list";
  version = "unstable-2022-01-04";

  src = fetchFromGitHub {
    owner = "speed47";
    repo = "btrfs-list";
    rev = "6a0b7705c64a1e8b7ef01e167d680389ea569397";
    sha256 = "1h46a6ikyf5zax7ksm3q6qkhjmdwv9w4l1qxibgqb3s0kj31fnn6";
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
