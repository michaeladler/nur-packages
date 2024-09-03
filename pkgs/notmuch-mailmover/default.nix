{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
, installShellFiles
}:

rustPlatform.buildRustPackage {
  pname = "notmuch-mailmover";
  version = "unstable-2024-09-02";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "d5d338660ae0dd368fc325726a26b364756be19b";
    sha256 = "1j8jxjn3kgrp094ywymkzn7mw0iqc2ayz0718d8yzxxqp51szvkg";
  };

  cargoHash = "sha256-GN5GiSmFIo1/DFozl9N5OK7gIY/IyRIa8EDrMhE4ItQ=";

  nativeBuildInputs = [ installShellFiles ];

  buildInputs = [ notmuch ];

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
