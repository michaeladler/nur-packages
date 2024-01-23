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
  version = "unstable-2024-01-22";

  src = fetchFromGitHub {
    owner = "str4d";
    repo = "age-plugin-yubikey";
    rev = "d31c60f733b2934865b32951b9ff77e1b1a53d04";
    sha256 = "0g0f7p3g7rs3qlfhy2lgbh1cih7jkqr2h2wrddzmj8sagwn19yn4";
  };

  cargoHash = "sha256-SK1ImaLrNye8CwxqNGHA09h5YXzIG5KsTjaONh39CSs=";

  nativeBuildInputs = lib.optionals stdenv.isLinux [ pkg-config ];

  buildInputs = [ pcsclite openssl ];

  meta = with lib; {
    description = "YubiKey plugin for age clients";
    homepage = "https://github.com/str4d/age-plugin-yubikey";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ vtuan10 ];
  };
}
