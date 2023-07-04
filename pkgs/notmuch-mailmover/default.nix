{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-07-03";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "94e0064af4eccc7f6002883e8b6efbc59365bb2c";
    sha256 = "0x5qzyqgqjv9s1jn9661ycn3cgraiz8xbjpvvypdbk5172dvg932";
  };

  cargoHash = "sha256-mu6jSJ15YTVD1Ju7CUTxygACj2I+gC3fuYe/z9Sm49g=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
