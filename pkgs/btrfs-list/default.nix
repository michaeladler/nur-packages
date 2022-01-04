{ stdenv, lib, fetchFromGitHub, makeWrapper, perl, btrfs-progs }:

stdenv.mkDerivation rec {
  pname = "btrfs-list";
  version = "unstable-2022-01-03";

  src = fetchFromGitHub {
    owner = "speed47";
    repo = "btrfs-list";
    rev = "fcf4a98f85dad72d838309c436e8f2b9324d3ada";
    sha256 = "0j0irqyskgj4110vx3aci3q68ss3rb33d2bdbki3ibym4hj51ngn";
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
