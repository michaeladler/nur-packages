{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
, installShellFiles
}:

rustPlatform.buildRustPackage {
  pname = "notmuch-mailmover";
  version = "0.3.0-unstable-2024-10-02";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "cb0d2f6645d163c186ed76c1ba48637f60e19431";
    sha256 = "sha256-1upLZcUrQrAkQfrEA8SmlPY38yaR8moJbEjdm24kQHo=";
  };

  cargoHash = "sha256-Jb+yQj7wjyALWmDDPL53oP52wDBFPfbWIT+zrPIAJ54=";

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
