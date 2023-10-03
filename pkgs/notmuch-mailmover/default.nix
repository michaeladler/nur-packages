{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-10-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "333771939d580afd9ee29fbbb4fa9952dc268e5e";
    sha256 = "0swybb17yc8xzxz2vsksmapla4mkvkkzany7dhjxmj0fr3asw7vv";
  };

  cargoHash = "sha256-gtLbbP5nqUMJnf1bzbs4dKqwqB0Dn3deODQwh6nqna8=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
