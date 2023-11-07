final: prev:

prev.brave.overrideAttrs (old:
  let metadata = with builtins; fromJSON (readFile ./metadata.json); in
  {
    inherit (metadata) version;

    src = final.fetchurl {
      inherit (metadata) url sha256;
    };

  })
