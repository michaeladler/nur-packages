{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2022-11-14";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "5456f72e217358e2a7c929c09a1c19dc5ad655e0";
    sha256 = "179rii4riim6xri9d3a265l20q53zccbsbgffp381kdbvqlij4h6";
  };

  cargoHash = "sha256-tsfM7QGT1iErdlCelKO8grrVoGc+hCh2mIs84T2l5Pw=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
