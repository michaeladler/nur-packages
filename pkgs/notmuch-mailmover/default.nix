{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
, installShellFiles
}:

rustPlatform.buildRustPackage {
  pname = "notmuch-mailmover";
  version = "unstable-2024-09-02";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "37170ddb8bb269395d59d9644a6ed0c51d91e548";
    sha256 = "0zsw59frw78cr1nn0c206biwhmdh02w7qx43rg282dxrml71rf2n";
  };

  cargoHash = "sha256-pcJd+coI2XV3VXvvtg/serOswdxxncI+7X+flYWCbic=";

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
