final: prev:

let zig_versions = with builtins; fromJSON (readFile ./index.json); in

prev.zig.overrideAttrs (old: {

  version = zig_versions.date;

  src = prev.fetchurl {
    url = zig_versions.x86_64-linux.tarball;
    sha256 = zig_versions.x86_64-linux.shasum;
  };

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  patches = [ ];

  doCheck = false;

  installPhase = let version = zig_versions.version; in
    ''
      mkdir -p "$out/bin"
      cp -a * "$out/"
      install -m0644 -D $out/LICENSE $out/share/${old.pname}/LICENSE
      rm -f $out/LICENSE
      ln -s "$out/zig" "$out/bin/zig"

      echo ${version} >> $out/VERSION
    '';

})
