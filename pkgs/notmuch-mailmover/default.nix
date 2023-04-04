{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-04-03";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "f7bf29dba2d0b7c71d951dac0b8ec0882f76ef76";
    sha256 = "0gqvpnaq6zdfcpbc4h26sgylr77hlm5kvdm1rc1n5vah3xhzk53x";
  };

  cargoHash = "sha256-sPARVoCZOzp5BvoNisV+aRkoC7+rdgzMpjU2UsKvZZw=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
