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
  version = "unstable-2023-04-09";

  src = fetchFromGitHub {
    owner = "str4d";
    repo = "age-plugin-yubikey";
    rev = "acc783d0d3697b4be71fb52b3b763f2e44e2ce6c";
    sha256 = "1amql7wxsfcqll38mm2v7iwnfvv5vn1i8rmpzp12gckn5ksg61ki";
  };

  cargoHash = "sha256-7X0rDaAnFkvJDfJ0FKvQ1FO6soV+2uJPCsyPshn+YDc=";

  nativeBuildInputs = lib.optionals stdenv.isLinux [ pkg-config ];

  buildInputs = [ pcsclite openssl ];

  meta = with lib; {
    description = "YubiKey plugin for age clients";
    homepage = "https://github.com/str4d/age-plugin-yubikey";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ vtuan10 ];
  };
}
