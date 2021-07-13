{ clangStdenv, lib, fetchgit, mesa, pkg-config }:

clangStdenv.mkDerivation rec {
  pname = "minigbm";
  version = "2021-07-08";

  src = fetchgit {
    url = "https://chromium.googlesource.com/chromiumos/platform/minigbm";
    rev = "2e63aaf616cdda26019d265989bd0d96ee11aab9";
    sha256 = "sha256-ty4Gygv4/hEcVVdIJ0DuDUX3GVI2flX5Kl1q8GKO1UQ=";
  };

  nativeBuildInputs = [ pkg-config ];

  patchPhase = ''
    sed -i -E -e 's/^ECHO =.*/ECHO = echo -e/' common.mk
  '';

  buildInputs = [ mesa ];

  makeFlags = [ "DESTDIR=$(out)" "LIBDIR=lib" ];

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
