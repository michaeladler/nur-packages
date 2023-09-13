{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-09-12";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "a6bcf2a2f3d07268fa3410aa903d85e2c70cf60f";
    sha256 = "0pbp3lbmzy46m9szbybndqipgznyvdpsk4zmkxfw1j7xcq8prczm";
  };

  cargoHash = "sha256-K5oQOniy+g/ncEFAnlmCMMBFBkT+HF+pcr40CHzG1ag=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
