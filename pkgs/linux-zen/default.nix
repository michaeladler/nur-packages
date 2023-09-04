{ lib, pkgs, fetchurl, buildLinux, ... }:

let
  metadata = with builtins; fromJSON (readFile ./metadata.json);
in

buildLinux (rec {
  inherit (metadata) version;
  modDirVersion = "${version}-${metadata.suffix}";

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v6.x/linux-6.5.tar.xz";
    sha256 = "sha256-eldLvCCALqdrUsp/rwcmf3IEXoYbGJFcUnKpjCer+IQ=";
  };

  kernelPatches = [
    {
      name = "zen";
      patch = fetchurl {
        inherit (metadata) url sha256;
      };
    }
  ];

  # use ld-linux-x86-64.so.2 --help to find out if x86-64-v4 is supported
  extraConfig = ''
    GENERIC_CPU n
    GENERIC_CPU3 y
    CC_OPTIMIZE_FOR_PERFORMANCE_O3 y
  '';

  extraMeta = {
    branch = lib.versions.majorMinor version;
    description = "Linux ZEN";
  };
})
