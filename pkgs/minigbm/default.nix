{ clangStdenv, lib, fetchgit, mesa, pkg-config }:

clangStdenv.mkDerivation rec {
  pname = "minigbm";
  version = "unstable-2021-10-07";

  src = fetchgit {
    url = "https://chromium.googlesource.com/chromiumos/platform/minigbm";
    rev = "c06cc9cccb3cf3c7f9d2aec706c27c34cd6162a0";
    sha256 = "1h1s6cbhz5w2d10fci3y65zahm8r517nv6wigh7l71hm2qm3vdkf";
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
