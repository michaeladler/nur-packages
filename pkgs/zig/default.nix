final: prev:

let zig_versions = with builtins; fromJSON (readFile ./index.json); in

prev.zig.overrideAttrs (old: {

  pname = "zig";
  version = zig_versions.version;

  src = builtins.fetchurl {
    url = zig_versions.x86_64-linux.tarball;
    sha256 = zig_versions.x86_64-linux.shasum;
  };

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  installPhase = ''
    mkdir -p "$out/bin"
    mv * "$out/"
    rm -f $out/LICENSE
    ln -s "$out/zig" "$out/bin/zig"
  '';

})
