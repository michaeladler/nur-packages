{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
, installShellFiles
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-10-25";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "5bb3104accd3c6f8364afcc15d373c5ef16f3197";
    sha256 = "183kwn8flc8hlp10q7435wrwx9vyfk5shxcn51j6s5w30xamm56p";
  };

  cargoHash = "sha256-TtpJKdWwzBBaa9k2mhJDNByPdBFtdqKsvmVXATg9Mc4=";

  nativeBuildInputs = [ installShellFiles ];

  buildInputs = [ notmuch ];

  postInstall = ''
    installManPage share/notmuch-mailmover.1
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
