{ clangStdenv, lib, fetchgit, mesa, pkg-config }:

clangStdenv.mkDerivation rec {
  pname = "minigbm";
  version = "unstable-2021-09-07";

  src = fetchgit {
    url = "https://chromium.googlesource.com/chromiumos/platform/minigbm";
    rev = "94a69bd0bf2726feaaa4a07fbdaa696c411226fc";
    sha256 = "1i2bqmd9xq14l1aviv7ywsx6yf4yg47l8cvr1310s9gj3y8kd287";
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
