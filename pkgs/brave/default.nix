final: prev:

let metadata = with builtins; fromJSON (readFile ./metadata.json); in

prev.brave.overrideAttrs (old: {

  version = metadata.version;

  postInstall = ''
    for fname in brave crashpad_handler; do
        patchelf \
            --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
            --set-rpath "$(patchelf --print-rpath $out/opt/brave.com/brave/brave)" $out/opt/brave.com/brave/$fname
    done
  '';

  src = prev.fetchurl {
    inherit (metadata) url sha256;
  };

})
