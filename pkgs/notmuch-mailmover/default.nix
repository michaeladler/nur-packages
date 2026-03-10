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
  version = "0.7.1-unstable-2026-03-09";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "521e35f6fad2fa87fe12f971a926268625ba0cba";
    sha256 = "sha256-V42Ckj42NKrXhvhoqVF5dEZVPlQxqMqd0adGPYf8vak=";
  };

  cargoHash = "sha256-CmUIJt2A/QcTiupXvFCJ8MvKJmzurCnmkG9MbHdWF0Q=";

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
