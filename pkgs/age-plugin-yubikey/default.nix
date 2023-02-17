{ lib
, stdenv
, rustPlatform
, fetchFromGitHub
, pkg-config
, pcsclite
, openssl
}:

rustPlatform.buildRustPackage rec {
  pname = "age-plugin-yubikey";
  version = "unstable-2023-02-16";

  src = fetchFromGitHub {
    owner = "str4d";
    repo = "age-plugin-yubikey";
    rev = "d9c5abaa15d00694a0127873aa39cf6be30d39ca";
    sha256 = "1fdzslmmlxvvsni3rbmxj4na0jw1gmzpq0xnfisgw4w4nk959h2a";
  };

  cargoHash = "sha256-K+S/kS8MdrVHP7fUU0I4P2eRD5NfKKgODtLyBAPQdLo=";

  nativeBuildInputs = lib.optionals stdenv.isLinux [ pkg-config ];

  buildInputs = [ pcsclite openssl ];

  meta = with lib; {
    description = "YubiKey plugin for age clients";
    homepage = "https://github.com/str4d/age-plugin-yubikey";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ vtuan10 ];
  };
}
