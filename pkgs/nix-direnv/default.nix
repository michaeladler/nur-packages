{ stdenv
, gnugrep
, nixStable
, nixUnstable
, enableFlakes ? true
, nix-direnv-upstream
}:

let
  nix = if enableFlakes then nixUnstable else nixStable;
in
nix-direnv-upstream.overrideAttrs (oa: {

  postPatch = ''
    sed -i "1a NIX_BIN_PREFIX=${nix}/bin/" direnvrc
    substituteInPlace direnvrc --replace "grep" "${gnugrep}/bin/grep"
  '';

})
