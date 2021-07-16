{ pkgs }:

pkgs.cpio.overrideAttrs (old: rec {
  # a version of cpio which can handle large files (> 2GB)
  # https://github.com/sbabic/meta-swupdate/blob/bbeb1f8112389ba5a5ef0fc1456854ec7012e4c5/recipes-extended/cpio/files/0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch
  patches = [ ./0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch ];
})
