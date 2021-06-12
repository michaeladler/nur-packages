{ stdenv
, gnugrep
, nixStable
, nixUnstable
, enableFlakes ? true
, orig
}:

let
  nix = if enableFlakes then nixUnstable else nixStable;
in
orig.overrideAttrs (oa: {

  postPatch = ''
    sed -i "1a NIX_BIN_PREFIX=${nix}/bin/" direnvrc
    substituteInPlace direnvrc --replace "grep" "${gnugrep}/bin/grep"
  '';

})
