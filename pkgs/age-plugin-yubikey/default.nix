{ lib
, stdenv
, rustPlatform
, fetchFromGitHub
, pkg-config
, pcsclite
}:

rustPlatform.buildRustPackage rec {
  pname = "age-plugin-yubikey";
  version = "unstable-2023-01-29";

  src = fetchFromGitHub {
    owner = "str4d";
    repo = "age-plugin-yubikey";
    rev = "84830103936b3a59085381e7155480a86575ceca";
    sha256 = "1cfx7xsz5ninl7kzm4z30i8w456vc5zy40rk89y2yjvvhy81c3ys";
  };

  cargoSha256 = "sha256-mmnq037Omy3MiXGkOKEC55Xb5SRmeeUfx7ODoJssbmI=";

  nativeBuildInputs = lib.optionals stdenv.isLinux [ pkg-config ];

  buildInputs = [ pcsclite ];

  patches = [
    ./ff3e8e37c9c3885657817feb82772dd3e1497d50.patch
  ];

  meta = with lib; {
    description = "YubiKey plugin for age clients";
    homepage = "https://github.com/str4d/age-plugin-yubikey";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ vtuan10 ];
  };
}
