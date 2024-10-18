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
  version = "0.4.0-unstable-2024-10-16";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "82e62016e42ecc0379a66112304bc853ccfbf3c4";
    sha256 = "sha256-gKA8R2mRH4d+sDArtF4MOxcWWACBPl1siskyxp/xEa4=";
  };

  cargoHash = "sha256-kXogp3g/9UmoMIxeJLe8mQKWX2B4jTy9RALt1wnve3M=";

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
