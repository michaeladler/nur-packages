{ clangStdenv, lib, fetchgit, mesa, pkg-config }:

clangStdenv.mkDerivation rec {
  pname = "minigbm";
  version = "unstable-2021-08-03";

  src = fetchgit {
    url = "https://chromium.googlesource.com/chromiumos/platform/minigbm";
    rev = "d9381b66288d8886d5d99bff7927748a1352c85a";
    sha256 = "1nis6487advbp9sml8wv59gjz3d04g0gaa6l7yxdjba10i6n55ny";
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
