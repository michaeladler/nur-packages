{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "notmuch-mailmover";
  version = "unstable-2023-03-01";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "notmuch-mailmover";
    rev = "e3edeca8d46d8c52e0d202708ce3fcba48e444d3";
    sha256 = "1kc0s0sszgdlhbhx98xmsmffhjf7hvkmxp45r2ip8pfvk6w02ba7";
  };

  cargoHash = "sha256-HPOZtsuViUzLoNUNK6klJTgd06smcgdPly1fn0o5hu4=";

  buildInputs = [ notmuch ];

  meta = with lib; {
    description = "notmuch-mailmover is a CLI application to assign notmuch *tagged* mails to IMAP folders";
    homepage = "https://github.com/michaeladler/notmuch-mailmover";
    license = licenses.asl20;
  };
}
