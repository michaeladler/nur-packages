{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
, installShellFiles
}:

rustPlatform.buildRustPackage {
  pname = "notmuch-mailmover";
  version = "0.3.0-unstable-2024-10-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "58968a79fc833ba9b68770db4a24e490f39e9db1";
    sha256 = "sha256-8mjesMqa01YfJdBbYhTczky0oLKubGzvGYe4LRSUHD4=";
  };

  cargoHash = "sha256-tjW4YS0Qs+lnxMY/Sr0smx59edu1FuvGqXmABk2DZBM=";

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
