{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-08-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "84467c7952ab997eea75bf7366e0fa48d061a5a9";
    sha256 = "0ffgn4i5ksq0g1agvfvc20njr424p2mk57qpkp7sif8gs28cxx2h";
  };

  cargoHash = "sha256-WBUU/yX0M44HHfOdfYaCN+DdBBDWQ3p5qroFfr7GpPA=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
