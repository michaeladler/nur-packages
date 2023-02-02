{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-02-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "ad4f9e6b19709ba7e7b7c216b35bbccfe8b06b0a";
    sha256 = "09d5npn810ild8h4iz1x4cdnhpzcvzzngdd72fx7wdd7rvaz5m1i";
  };

  cargoHash = "sha256-98U29TX3h2mg+F25doimwo3jh3LLJcXTbiKDPaF5LF8=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
