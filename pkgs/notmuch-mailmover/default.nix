{
  lib,
  rustPlatform,
  fetchFromGitHub,
  notmuch,
  installShellFiles,
  pkg-config,
  lua5_4,
}:

rustPlatform.buildRustPackage {
  pname = "notmuch-mailmover";
  version = "0.7.1-unstable-2026-04-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "65ec1c9b5c7f09ce96470d0c8cc612e12b76e002";
    sha256 = "sha256-6PmfzMyXYOupMV6aS2X4su3kRdQ0fGjm53BTxe+pWkM=";
  };

  cargoHash = "sha256-zmwqzvqoeEVx6MpaWoHGLm7lroeAYmHoU1bzUYHCgDo=";

  nativeBuildInputs = [
    installShellFiles
    pkg-config
  ];

  buildInputs = [
    notmuch
    lua5_4
  ];

  postInstall = ''
    installManPage share/notmuch-mailmover.1.gz
    installShellCompletion --cmd notmuch-mailmover \
      --bash share/notmuch-mailmover.bash \
      --fish share/notmuch-mailmover.fish \
      --zsh share/_notmuch-mailmover
  '';

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
