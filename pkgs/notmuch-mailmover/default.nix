{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
, installShellFiles
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2024-03-04";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "5ea9378eb5a568da0212c3741e8cf8bb51b6542b";
    sha256 = "1myp2y1iyrckcs3279al1k9gwlm1mnmza2v5pxp56jgk0gzwar6z";
  };

  cargoHash = "sha256-iy8vk8T2JlaT4YdnB32oT4lPYeMmt74xbbdWRRyrdjk=";

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
