{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-09-11";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "9fd0a8d28a0879061257a7b13d47312863d42153";
    sha256 = "0hykcfrglsl13242n656kync5z36b58nhl3hrldsqs0hdz3b788i";
  };

  cargoHash = "sha256-27XyXfERKN4a4scpDV6/G2Gx4E3lWqQWZ0RqJeBF8K0=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
