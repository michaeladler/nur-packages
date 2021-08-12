final: prev:

let metadata = with builtins; fromJSON (readFile ./metadata.json); in

prev.brave.overrideAttrs (old: {

  version = metadata.version;

  src = prev.fetchurl {
    inherit (metadata) url sha256;
  };

})
