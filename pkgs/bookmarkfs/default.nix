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
  version = "0.1.5-unstable-2025-10-15";

  src = fetchFromSourcehut {
    owner = "~cismonx";
    repo = "bookmarkfs";
    rev = "54d81fa5b025d06f638943063b7a5d09392e1685";
    sha256 = "sha256-cxGb24JQXo0fHFyEgCAS4bajzBde8pbI4co9XNsqCjs=";
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

  env = {
    NIX_CFLAGS_COMPILE = "-std=gnu11";
  };

  meta = {
    description = "FUSE-based pseudo-filesystem for managing web browser bookmarks";
    homepage = "https://git.sr.ht/~cismonx/bookmarkfs";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };

}
