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
  version = "unstable-2023-02-11";

  src = fetchFromGitHub {
    owner = "str4d";
    repo = "age-plugin-yubikey";
    rev = "70c109aa1db99b12613768b00a0b830838859aa8";
    sha256 = "1fyh02f7y0ll8y1mvg1d30pbqwvlys3phjh6fpwz09dky6swl154";
  };

  cargoHash = "sha256-D5q7VWivFVSEP88B8i7CpkC8mY2lp0f2dz5dntk6hbg=";

  nativeBuildInputs = lib.optionals stdenv.isLinux [ pkg-config ];

  buildInputs = [ pcsclite openssl ];

  meta = with lib; {
    description = "YubiKey plugin for age clients";
    homepage = "https://github.com/str4d/age-plugin-yubikey";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ vtuan10 ];
  };
}
