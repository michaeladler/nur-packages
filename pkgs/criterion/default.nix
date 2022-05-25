{ stdenv, lib, fetchurl }:

let metadata = with builtins; fromJSON (readFile ./metadata.json); in

stdenv.mkDerivation rec {
  pname = "criterion";
  inherit (metadata) version;

  src = fetchurl {
    inherit (metadata) url sha256;
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/lib
    mv lib/libcriterion* $out/lib

    find $out/lib -type f | while read fname; do
      patchelf --set-rpath ${stdenv.glibc.out}/lib $fname
    done

    mv include $out
    mv lib/pkgconfig $out/lib
    sed -i -e "s|^prefix=.*|prefix=$out|" $out/lib/pkgconfig/criterion.pc
  '';

  meta = with lib; {
    description = "A cross-platform C and C++ unit testing framework for the 21th century";
    homepage = "https://github.com/Snaipe/Criterion";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
