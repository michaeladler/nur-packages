{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
, installShellFiles
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-10-22";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "f6930287d14ffbd2cfccc10e042a35bb1b89b584";
    sha256 = "19c3r9v3rgh3yqjfd1ayq2wbqgh6k0gyc1lfd1m70yswp9g7k8zg";
  };

  cargoHash = "sha256-lSK+RLq7A8K39Dl+a+0pRZ7yuUDmK5B37aYC82wTRt4=";

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
