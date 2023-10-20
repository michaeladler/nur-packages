{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-10-20";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "5df1746d3298eb176f8e80ce270046fca6450edf";
    sha256 = "1fw3n3vb7hlvvyy1ghpfb6zh1sdr54hdgccrsyssgyk90s7pbhzg";
  };

  cargoHash = "sha256-wWDFqF0aBDsMfy8uYFs1CTn4MhfGdmb89sdgl0b6n2o=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
