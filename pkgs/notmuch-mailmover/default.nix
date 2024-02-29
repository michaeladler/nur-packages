{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
, installShellFiles
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2024-02-28";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "15f7d28dcd8e4b0e66e5062a4bed0fc0e5bf72e3";
    sha256 = "0bn1545inw61mbhxsgysbnm44n70hq5dla9wn5dxd27f036nmvq7";
  };

  cargoHash = "sha256-aZJUJ++H3nReCPRUT7/iZrNZadbTKJM3cnx8swkjWTs=";

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
