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
  version = "0.1.5-unstable-2025-09-27";

  src = fetchFromSourcehut {
    owner = "~cismonx";
    repo = "bookmarkfs";
    rev = "6c75d56c5dc5b1ec0a3af7ba9b143fa8000d63ed";
    sha256 = "sha256-Op3F0jIwsIPOfRpiTJ3RCgBNmrlEhduX4QladsAQDN8=";
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
