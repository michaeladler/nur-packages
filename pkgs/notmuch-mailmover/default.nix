{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2022-12-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "8fda4b58a43ed25978ac6e619e9e5b5397ccd884";
    sha256 = "0qv37y5mhfwrrpll0m1abag86vzknr6w1mdan1n7wpk4ph5vxdav";
  };

  cargoHash = "sha256-6xlNA6ThBDwpw7+iKWtRwVudd2Iqwp6a4jfjgrdOx0o=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
