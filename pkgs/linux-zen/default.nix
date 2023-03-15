{ lib, pkgs, fetchurl, buildLinux, ... }:

let
  version = "6.2.6";
  zen_suffix = "zen1";
in

buildLinux ({
  inherit version;
  modDirVersion = "${version}-${zen_suffix}";

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v6.x/linux-6.2.tar.xz";
    sha256 = "sha256-dIYvqKtA7a6FuzOFwLcf4QMoi85RhSbWMZeACzy97LE=";
  };

  kernelPatches = [
    {
      name = "zen";
      patch = fetchurl {
        url = "https://github.com/zen-kernel/zen-kernel/releases/download/v${version}-${zen_suffix}/v${version}-${zen_suffix}.patch.xz";
        sha256 = "07sfhzghlsxckvkw32csvlf7rwa0dsajymasgp17h01llp4l5d1a";
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
    branch = "6.2";
    description = "Linux ZEN";
  };
})
