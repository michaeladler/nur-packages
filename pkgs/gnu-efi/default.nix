final: prev:

prev.gnu-efi.overrideAttrs (old: rec {
  version = "3.0.17";

  src = final.fetchurl {
    url = "mirror://sourceforge/gnu-efi/gnu-efi-3.0.17.tar.bz2";
    sha256 = "1x6agc4a3c1jq23gb338i5g26wi879q39fgb8ahsfhwk6h1yj1vq";
  };

})
