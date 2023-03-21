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
  version = "unstable-2023-03-21";

  src = fetchFromGitHub {
    owner = "str4d";
    repo = "age-plugin-yubikey";
    rev = "af71a17f51ed0193b170620188863ab2afa633cb";
    sha256 = "1cq8f418h6vflaijd9zral4c4k1gfbwh5lpii765j7z5lmqkvdah";
  };

  cargoHash = "sha256-wQGtCG7biYmfvlNKrR3xxpJ0aApnyYj6unNuKNFDNQg=";

  nativeBuildInputs = lib.optionals stdenv.isLinux [ pkg-config ];

  buildInputs = [ pcsclite openssl ];

  meta = with lib; {
    description = "YubiKey plugin for age clients";
    homepage = "https://github.com/str4d/age-plugin-yubikey";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ vtuan10 ];
  };
}
