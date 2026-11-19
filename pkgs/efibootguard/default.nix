{
  stdenv,
  lib,
  fetchFromGitHub,
  autoreconfHook,
  autoconf-archive,
  pkg-config,
  check,
  gnu-efi,
  zlib,
  glibc,
  pciutils,
  python3,
  installShellFiles,
}:

stdenv.mkDerivation {

  pname = "efibootguard";
  version = "0.22-unstable-2026-09-24";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "efibootguard";
    rev = "a2f329f6e2185de5725fc8e4e36471194e4e1652";
    sha256 = "sha256-OHAOO7xvtPggzRAnQNIb2JrLtRyqbpIyrxvZluIgBpE=";
  };

  nativeBuildInputs = [
    autoreconfHook
    autoconf-archive
    pkg-config
    check
    (python3.withPackages (ps: with ps; [ shtab ]))
    installShellFiles
  ];

  buildInputs = [
    gnu-efi
    zlib
    glibc
    pciutils
  ];

  configureFlags = [
    "--with-gnuefi-include-dir=${gnu-efi}/include/efi"
    "--with-gnuefi-lib-dir=${gnu-efi}/lib"
  ];

  postInstall = ''
    installShellCompletion --zsh --name _bg_printenv $out/share/efibootguard/completion/zsh/_bg_printenv
    installShellCompletion --zsh --name _bg_setenv $out/share/efibootguard/completion/zsh/_bg_setenv

    installShellCompletion --bash --name bg_printenv.bash $out/share/efibootguard/completion/bash/bg_printenv.bash
    installShellCompletion --bash --name bg_setenv.bash $out/share/efibootguard/completion/bash/bg_setenv.bash

    rm -rf $out/share/efibootguard/completion
  '';

  meta = with lib; {
    homepage = "https://github.com/siemens/efibootguard";
    description = "Simple UEFI boot loader with support for safely switching between current and updated partition sets";
    platforms = platforms.all;
    license = licenses.gpl2Plus;
  };
}
