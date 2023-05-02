{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-05-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "69d214a4141b1fa7ba4840bf20b03734ac1485dc";
    sha256 = "1v7j09h1jy4il6hmzd90j6557cwj1m4k06qxrma7j4i82npcsqy0";
  };

  cargoHash = "sha256-Xt2iwPHL8DxoV0iU3KlacJ1LBcVSjt7ilcWwANeQlRI=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
