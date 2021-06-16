final: prev:

prev.nix-direnv.overrideAttrs (oa: {

  postPatch = ''
    sed -i "1a NIX_BIN_PREFIX=${final.nixUnstable}/bin/" direnvrc
    substituteInPlace direnvrc --replace "grep" "${final.gnugrep}/bin/grep"
  '';

})
