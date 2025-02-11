{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
, installShellFiles
, pkg-config
, lua5_4
}:

rustPlatform.buildRustPackage {
  pname = "notmuch-mailmover";
  version = "0.6.0-unstable-2025-02-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "0f612d6ccf1edc9a38962589ae3cf58d1d6dc044";
    sha256 = "sha256-UYrMy11Syk+CifgiCUaf8ufJZtw2jYlzd4n1W1Ud2W8=";
  };

  cargoHash = "sha256-dcADigjc/SbIggicPY3Q7WmxAcaS0/Yxa1nEvDDy7EA=";

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
