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
  version = "0.6.0-unstable-2025-04-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "46ca6b1b4eda06cb7de621e1b4587a7a8dc47cb1";
    sha256 = "sha256-hBKNSW6jXEAWCq8HkgnY9XlaRq8H1ZQyYwcZEPHcyXs=";
  };

  cargoHash = "sha256-X/JSNe5qQ2hykM6YqVp+rV00jK1NYLbnSRndjRfVs1c=";

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
