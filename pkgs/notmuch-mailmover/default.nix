{
  lib,
  rustPlatform,
  fetchFromGitHub,
  notmuch,
  installShellFiles,
  pkg-config,
  lua5_4,
}:

rustPlatform.buildRustPackage {
  pname = "notmuch-mailmover";
  version = "0.7.1-unstable-2026-06-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "e54a4b6ece6c61958ca101beb6179e12f2212e5b";
    sha256 = "sha256-bMolo1M6CpBYdPNgdZwqdNHisSNCRBYHZkjt2wl2TK4=";
  };

  cargoHash = "sha256-J650EZdDJXI+6QZQUq8GUW5sxBfFLJ1fKiEiEZEC0Hc=";

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
