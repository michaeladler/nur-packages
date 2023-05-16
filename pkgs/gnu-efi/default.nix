final: prev:

prev.gnu-efi.overrideAttrs (old: rec {
  version = "3.0.17";

  src = final.fetchurl {
    url = "mirror://sourceforge/gnu-efi/${old.pname}-${version}.tar.bz2";
    sha256 = "sha256-eAfpAzSTQ6ehQuu5NHA6KHIjXolojPWGwDKwoQh7yvQ=";
  };

})
