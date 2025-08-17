{
  stdenv,
  lib,
  fetchFromSourcehut,
  autoreconfHook,
  pkg-config,
  libtool,
  autoconf-archive,
  gnumake,
  gcc,
  texinfo,
  fuse3,
  libseccomp,
  sqlite,
  jansson,
  nettle,
  readline,
  uriparser,
  xxHash,
}:

stdenv.mkDerivation {
  pname = "bookmarkfs";
  version = "0.1.3-unstable-2025-08-16";

  src = fetchFromSourcehut {
    owner = "~cismonx";
    repo = "bookmarkfs";
    rev = "6d2e3e276c63f459c032708e4df3ae4f5b069283";
    sha256 = "sha256-3fz46qW0JSzsekhQ1K37KAXWowuyl2BR3ewL4a3gxtM=";
  };

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  buildInputs = [
    libtool
    autoconf-archive
    gnumake
    gcc
    texinfo
    libseccomp

    fuse3
    libseccomp
    sqlite
    jansson
    nettle
    readline
    uriparser
    xxHash
  ];

  configureFlags = [
    "--enable-bookmarkfs-mount"
    "--enable-bookmarkfs-fsck"
    "--enable-bookmarkfs-mkfs"
    "--enable-bookmarkctl"
    "--enable-backend-firefox"
    "--enable-backend-chromium"
  ];

  meta = {
    description = "FUSE-based pseudo-filesystem for managing web browser bookmarks";
    homepage = "https://git.sr.ht/~cismonx/bookmarkfs";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };

}
