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
  version = "0.4.0-unstable-2024-10-07";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "1323e7e62b75a318213b3c5ebf2a6bf6b08beebd";
    sha256 = "sha256-b0JG6qJSWOutVKI6vDGXmuZ5kbwjx2N1M9e9LMT4nj8=";
  };

  cargoHash = "sha256-0XGsXXjfCYCCl8JhLp/ZO+YD3/nI9Zj/3Jp72+0VIBA=";

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
