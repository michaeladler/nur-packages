{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-06-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "307b7f5b2cbb817752b98c961d32f78c9219e8e6";
    sha256 = "191xkh6sm97is8jnl7mmjgqwrb9p5z9yfnw88zmp4a6a77ghyq8q";
  };

  cargoHash = "sha256-eF5giCZeHg0Q9CKjeapRimSuYuAlrY1lQ4dgpEPXncg=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
