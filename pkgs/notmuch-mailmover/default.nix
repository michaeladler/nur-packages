{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-01-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "2ba0823d9e057c19af1b8a732668640c8ba251a5";
    sha256 = "1h2fm8g7dzzabf62wpmmp3f3iph1bamr1f63m15mxi2jnppkzk40";
  };

  cargoHash = "sha256-CZLIn6Tta5JrtHuG4dJJ2rp+YMVV5EqVwLfqlV6lx5M=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
