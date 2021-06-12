{ stdenv, lib, ... }:

let zig_versions = with builtins; fromJSON (readFile ./index.json);

in stdenv.mkDerivation rec {

  pname = "zig";
  version = zig_versions.version;

  src = with builtins;
    fetchurl {
      url = zig_versions.x86_64-linux.tarball;
      sha256 = zig_versions.x86_64-linux.shasum;
    };

  installPhase = ''
    mkdir -p "$out/bin"
    mv * "$out/"
    rm -f $out/LICENSE
    ln -s "$out/zig" "$out/bin/zig"
  '';

  meta = with lib; {
    description =
      "Programming languaged designed for robustness, optimality, and clarity";
    homepage = "https://ziglang.org/";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = [ maintainers.andrewrk ];
  };

}
