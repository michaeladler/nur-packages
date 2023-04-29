{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-04-28";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "3419bcf7ae784d7df2a155789edc48b7e344999b";
    sha256 = "1bcsaggjnms1x1b6yv30gq9x681dzz30dy05f0zml1yyr8i5ks1n";
  };

  cargoHash = "sha256-sXnHu/zfRP5lF/c3P93RCpcZTlTYglx7rT93kP4evX4=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
