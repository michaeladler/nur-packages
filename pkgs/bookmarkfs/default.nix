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
  tcl,
  uriparser,
  xxHash,
}:

stdenv.mkDerivation {
  pname = "bookmarkfs";
  version = "0.1.3-unstable-2025-07-27";

  src = fetchFromSourcehut {
    owner = "~cismonx";
    repo = "bookmarkfs";
    rev = "bdbea3cfb862f8508f439dda63d4b30ffae3a646";
    sha256 = "sha256-J/HaJp9B7KDuP+aGebUMesLveW2870rU9WLuUMRLQSI=";
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
    tcl
    uriparser
    xxHash
  ];

  configureFlags = [
    "--enable-bookmarkfs-mount"
    "--enable-bookmarkfs-fsck"
    "--enable-bookmarkfs-mkfs"
    "--enable-bookmarkctl"
    "--enable-fsck-handler-tcl"
    "--enable-backend-firefox"
    "--enable-backend-chromium"
  ];

  meta = {
    description = "FUSE-based pseudo-filesystem for managing web browser bookmarks";
    homepage = "https://git.sr.ht/~cismonx/bookmarkfs";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };

}
