{ lib
, stdenv
, rustPlatform
, fetchFromGitHub
, pkg-config
, pcsclite
}:

rustPlatform.buildRustPackage rec {
  pname = "age-plugin-yubikey";
  version = "unstable-2023-01-03";

  src = fetchFromGitHub {
    owner = "str4d";
    repo = "age-plugin-yubikey";
    rev = "f34c534e8479e4c50095a98f48941d079bd179a3";
    sha256 = "0lb03y2m88k5a968q804rik237bp111njvc8ckhj8cdpfp1h4pwm";
  };

  cargoSha256 = "sha256-abrgWuhiiM/ah20Cz9dVjTzsYzZjSngV750zrFFz8LI=";

  nativeBuildInputs = lib.optionals stdenv.isLinux [ pkg-config ];

  buildInputs = [ pcsclite ];

  meta = with lib; {
    description = "YubiKey plugin for age clients";
    homepage = "https://github.com/str4d/age-plugin-yubikey";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ vtuan10 ];
  };
}
