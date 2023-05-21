{ lib, pkgs, fetchurl, buildLinux, ... }:

let
  metadata = with builtins; fromJSON (readFile ./metadata.json);
in

buildLinux (rec {
  inherit (metadata) version;
  modDirVersion = "${version}-${metadata.lqx_suffix}";

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v6.x/linux-6.3.tar.xz";
    sha256 = "sha256-ujSR9e1r0nCjcMRAQ049aQhfzdUoki+gHnPXZX23Ox4=";
  };

  kernelPatches = [
    {
      name = "lqx";
      patch = fetchurl {
        url = metadata.lqx_url;
        sha256 = metadata.lqx_sha256;
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
    description = "Linux lqx";
  };
})
