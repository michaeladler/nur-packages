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
  version = "unstable-2024-08-04";

  src = fetchFromGitHub {
    owner = "str4d";
    repo = "age-plugin-yubikey";
    rev = "ca1cd587ff289ee1b9d8f72120e5a2acfb9560ae";
    sha256 = "1cg40hys99p9z107c9ndsh8fh8ql6v9hjjm1qniflarpxwynf27n";
  };

  cargoHash = "sha256-/HoI+WVTUjzpBufgLsTdl5SRa36jYp3AIIPCuc2yHSI=";

  nativeBuildInputs = lib.optionals stdenv.isLinux [ pkg-config ];

  buildInputs = [ pcsclite openssl ];

  meta = with lib; {
    description = "YubiKey plugin for age clients";
    homepage = "https://github.com/str4d/age-plugin-yubikey";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ vtuan10 ];
  };
}
