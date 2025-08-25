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
  version = "0.1.3-unstable-2025-08-23";

  src = fetchFromSourcehut {
    owner = "~cismonx";
    repo = "bookmarkfs";
    rev = "250f8cd4f6d7797176d9ac90c450415800f42fb8";
    sha256 = "sha256-LKpB1vbkFsKXqf2iI0/Db7sPYv3fIYVawKbkkIZqYWw=";
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
