{ clangStdenv, lib, fetchgit, mesa, pkg-config }:

clangStdenv.mkDerivation rec {
  pname = "minigbm";
  version = "unstable-2021-09-29";

  src = fetchgit {
    url = "https://chromium.googlesource.com/chromiumos/platform/minigbm";
    rev = "84236dd5a27527c8149a4660c5f4014dee2a52e6";
    sha256 = "0xwsjzxqlnmvwbdyq2d4vwbqf0jfq79wxmijybx7fz30svvlwxm3";
  };

  nativeBuildInputs = [ pkg-config ];

  patchPhase = ''
    sed -i -E -e 's/^ECHO =.*/ECHO = echo -e/' common.mk
  '';

  buildInputs = [ mesa ];

  # see https://afrantzis.com/posts/running-chromium-with-ozone-gbm-on-a-gnu-linux-desktop-system/
  makeFlags = [
    "CPPFLAGS=-DDRV_I915"
    "DRV_I915=1"
    "DESTDIR=$(out)"
    "LIBDIR=lib"
  ];

  postInstall = ''
    cd $out/lib
    ln -s libminigbm.so.1.0.0 libminigbm.so
  '';

  meta = with lib; {
    homepage = "https://chromium.googlesource.com/chromiumos/platform/minigbm/";
    description = "Generic Buffer Management (GBM) implementation used in Chromium OS";
    platforms = [ "x86_64-linux" ];
    license = licenses.bsd3;
  };
}
