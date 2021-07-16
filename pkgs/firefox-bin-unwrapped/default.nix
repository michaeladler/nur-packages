final: prev:

let metadata = with builtins; fromJSON (readFile ./metadata.json); in

prev.firefox-bin-unwrapped.override {
  generated = {
    version = metadata.version;
    sources = [
      {
        inherit (metadata) url sha256;
        locale = "en-US";
        arch = "linux-x86_64";
      }
    ];
  };
}
