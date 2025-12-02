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
  version = "0.7.1-unstable-2025-12-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "6aa6b5dd2300838137b18a746178748902af6808";
    sha256 = "sha256-3djfEC8GChWwzOAG6h1lrEltCcJQb1kjefKC+u17MfQ=";
  };

  cargoHash = "sha256-Ni4i6l9pCQk/3YCv2f/LKCB2daIGwUnb0i4S9jGSNdw=";

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
