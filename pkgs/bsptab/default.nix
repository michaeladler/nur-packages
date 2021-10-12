{ stdenv, lib, fetchFromGitHub, makeWrapper, bspwm, tabbed, bash, coreutils, gawk, xdotool, xorg }:

stdenv.mkDerivation rec {
  pname = "bsptab";
  version = "unstable-2021-10-11";

  src = fetchFromGitHub {
    owner = "albertored11";
    repo = "bsptab";
    rev = "93c1299846ecab23d4ca9de45da156e2aec66ca2";
    sha256 = "01ycmdh902c5hyp5lv98y6ssw3pkmn5wr8n1kqf05xfvg8m9jq8v";
  };

  nativeBuildInputs = [ makeWrapper ];

  patchPhase = ''
    patchShebangs tabbed-sub
    patchShebangs tabbed-unsub
    patchShebangs tabc
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp tabc tabbed-sub tabbed-unsub $out/bin/
    chmod 0755 $out/bin/*
  '';

  wrapperPath = with lib; makeBinPath [
    bspwm
    tabbed
    bash
    coreutils
    gawk
    xorg.xwininfo
    xorg.xprop
    xdotool
  ];

  postFixup = ''
    for prog in tabc tabbed-sub tabbed-unsub; do
      wrapProgram $out/bin/$prog \
        --prefix PATH : "${wrapperPath}"
    done
  '';

  meta = with lib; {
    homepage = "https://github.com/albertored11/bsptab";
    description = "Get a nice tree-style view of your btrfs subvolumes/snapshots";
    platforms = platforms.linux;
    license = licenses.mit;
  };

}
