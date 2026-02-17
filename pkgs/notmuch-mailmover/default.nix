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
  version = "0.7.1-unstable-2026-02-16";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "02363cd0f310d9e124814aff08ffaed28616c6a0";
    sha256 = "sha256-YAh3kPunwp4U3yDI15cSJS+LB4mT/8od3wpW98cYQ68=";
  };

  cargoHash = "sha256-Uzj8oAM6M6q3ih/SBFeNDQjd/R/1ZVq5cgvBE1fLQqI=";

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
