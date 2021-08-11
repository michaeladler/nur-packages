{ clangStdenv, lib, fetchgit, mesa, pkg-config }:

clangStdenv.mkDerivation rec {
  pname = "minigbm";
  version = "unstable-2021-08-10";

  src = fetchgit {
    url = "https://chromium.googlesource.com/chromiumos/platform/minigbm";
    rev = "1b252e2ee2316d4087e616b21c9ed75cc77f89b9";
    sha256 = "1qn6pcanynrnq7zbw1y7vh0vrm8pbzl1pwm2l6afx5j4z3g3jwld";
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
