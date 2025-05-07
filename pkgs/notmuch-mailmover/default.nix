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
  version = "0.7.0-unstable-2025-05-06";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "88c1071ec159ee0072f5e12178f5f1d3bc03da4b";
    sha256 = "sha256-xX1sH+8DaLgCzkl5WwwNEE9+iTdZX0d64SxfmvuVVgs=";
  };

  cargoHash = "sha256-5jEM5FURnfuoOiu2rqsh4shMp1ajv0zMpIx7r0gv6Bc=";

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
