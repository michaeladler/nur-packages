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
  version = "unstable-2023-03-23";

  src = fetchFromGitHub {
    owner = "str4d";
    repo = "age-plugin-yubikey";
    rev = "22fd00bd22ee8a8fe9f3b33db2e4b7eea944bf37";
    sha256 = "0wa7jj9cyrlnw3vz9nnplgq9aq0wja256cp68iichpnwdg6fcsyy";
  };

  cargoHash = "sha256-MacNqILbJ1FSNY2E90Vo19JkFNGfcILuRHOdsXracI8=";

  nativeBuildInputs = lib.optionals stdenv.isLinux [ pkg-config ];

  buildInputs = [ pcsclite openssl ];

  meta = with lib; {
    description = "YubiKey plugin for age clients";
    homepage = "https://github.com/str4d/age-plugin-yubikey";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ vtuan10 ];
  };
}
