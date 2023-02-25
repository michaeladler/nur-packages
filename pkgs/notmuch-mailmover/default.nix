{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-02-24";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "e7b5a0302327e5157601bfeb940af6ba230494b3";
    sha256 = "0ws0mq5a4gz2sya0qgmqr8aw5gggxabg8dmrdkn5s6qzfmng0fk5";
  };

  cargoHash = "sha256-PdDZatcAFKmNRE/bXvsml5yzsMqESsmj3N4R30sc7yw=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
